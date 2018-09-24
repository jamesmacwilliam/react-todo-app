cd aks
terraform init
terraform apply -auto-approve -var-file=../docker.tfvars
