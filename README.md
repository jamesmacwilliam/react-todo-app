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
 - `yarn run dev_aks` to spin up a local kubernetes cluster to match what will be deployed to AKS
 
 ## AWS Deployment
  - setup a new aws account and add credentials to `~/.aws/credentials` under the appropriate profile (`[personal]`) is the default
  - build a new AMI and deploy to aws via `yarn run aws`
