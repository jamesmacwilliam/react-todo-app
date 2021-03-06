 # React Todo App

 ##  Dependencies
 - packer (https://www.packer.io)
 - terraform (https://www.terraform.io)
 - puppet
 - an AWS account

 ## AWS Development
 - `yarn && yarn start` to view dev server
 - `yarn run dev_aws` to spin up dev server matching the aws ami that would be generated
 - visit `http://172.31.0.201` to see centos machine with your app running on it

 ## AKS Development
 - install docker for mac
 - enable kubernetes via: preferences -> kubernetes -> `Enable Kubernetes` (default orchestrator `Kubernetes`) -> Apply
 - follow this tutorial to setup kubernetes dashboard: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
 - run `kubectl proxy` to start kubernetes dashboard on port 8001
 - note: if you set your kubernetes dashboard up correctly, you should see the dashboard at: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy
 - `yarn run dev_aks` to build a local docker image, spin up a local kubernetes service + replication controller, and visit the load balancer service (matching what will be deployed to AKS)

 ## AKS Deployment
 - install kubectl (should be installed if you enabled kubernetes in the development workflow, otherwise: https://kubernetes.io/docs/tasks/tools/install-kubectl/)
 - Azure CLI: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
 - a Docker Hub account https://hub.docker.com
 - an Azure account https://portal.azure.com
 - copy `aks/terraform.tfvars.example > aks/terraform.tfvars` and fill in the variables
 - `yarn run aks` (will login to azure via `az login` and to docker hub via `docker login`)
 - visit your site at the given `site_address` or view the kubernetes dashboard via `yarn run aks_desktop`
 
 ## AWS Deployment
  - setup a new aws account and add credentials to `~/.aws/credentials` under the appropriate profile (`[personal]`) is the default
  - build a new AMI and deploy to aws via `yarn run aws`
