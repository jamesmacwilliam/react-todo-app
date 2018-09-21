# get docker_username from vars file to login to docker
docker_username=$(grep docker_username docker.tfvars | cut -d'"' -f2)

# get checksum of app directory to determine if we need to rebuild docker image
dir=app
dirsum=0
for sum  in $(find ${dir} -type f | xargs cksum | awk '{print $1}')
do
  dirsum=$(( ${sum} + ${dirsum} ))
done
inc=$(date)

echo '====================== docker hub login ============================'
docker login --username $docker_username

echo '====================== azzure login ============================'
az login

# build and push image + build container + build cluster
cd aks
terraform init
terraform apply -auto-approve -var-file=../docker.tfvars -var "cksum=${dirsum}" -var "inc=${inc}" || terraform apply -auto-approve -var-file=../docker.tfvars -var "cksum=${dirsum}" -var "inc=${inc}"
