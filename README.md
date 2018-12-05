# AWS Terraform Mult-Cloud (Azure) Demo 

This configuration should not be used in a production environment, it is for demonstration purposes only.  Key ideas demonstrated:
  - Azure VM with Provisioners 
  - Instance Provisioning of Docker

# Before you start

  - This demo assumes your AZURE credentials are defined and present in your environment. 
```
env | grep ARM
ARM_SUBSCRIPTION_ID=xxx
ARM_CLIENT_SECRET=xxx
ARM_TENANT_ID=xxx
ARM_CLIENT_ID=xxx

````

### Step to execute
* Besure to change the Admin password if you intend on logging into the instance
* terraform init
* terraform plan
* terraform apply
* The public IP addresses will be displayed, then test the API
```
  curl http://<IPv4 address>/:80/hello
```
* terraform destroy
