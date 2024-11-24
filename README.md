# terraform
first project in terraform


# terraform instance import from aws to tfstate
 1. Create ec2 instance in aws
 2. create provider.tf and version.tf
 3. "terraform init"  command to run
 4. create simple ec2 instance resource into terraform file 
 5. import created ec2 in AWS with that command "terraform import aws.instance.instance_name id-ec2(in aws)  or for bucket => terraform import aws_s3_bucket.bucket bucketNameInAWS
 6. terraform plan 
 7. change terrform code until there is no changes to plan


 # terraform replace command
 1. Create ec2 within terraform 
 2. terraform init - terrform plan - terraform apply
 3. "terraform apply -replace="aws_instance.nameinstance_created_into_terraform>  to replace the instance


# terraform plan/apply --target="aws_instance.instance_resource_name"