This repo consists of terraform code to create VPC, Subnet, Internet Gateway, Route table

 ## Clone the website into your local machine
 
    git clone 

 ## Change to devops-assessment directory
    cd 1a
## Now run the below to install the required providers
 terraform init    

## then run the below so that it will show us the resources that its going to create 
 terraform plan    

## then run o actually create the resources
 terraform apply   


Note:
All the values which are required for creating vpc, subnet, igw, route tables will be taken from 'var.tf' file and the sensitive info will be taken from the tfvars file.
