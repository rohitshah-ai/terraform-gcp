cd terraform/environments/dev

terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply 



cd terraform/environments/prod

terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply