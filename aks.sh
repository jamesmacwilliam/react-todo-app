docker_username=$(grep docker_username aks/terraform.tfvars | cut -d'"' -f2)
cd aks_container
echo '====================== azzure login ============================'
az login
terraform apply -auto-approve
terraform output kube_config > ~/.kube/aksconfig
export KUBECONFIG=~/.kube/aksconfig
echo "run: `kubectl get pods` to see your pods on azure"
cd ..
docker build -t $docker_username/todo -f Dockerfile .
echo '====================== docker hub login ============================'
docker login --username $docker_username
docker push $docker_username/todo
cd aks
terraform apply --auto-approve
