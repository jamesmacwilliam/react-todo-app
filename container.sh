cd dev_aks
terraform init
terraform apply -auto-approve -var-file=../docker.tfvars
open http://127.0.0.1:8080
