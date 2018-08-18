 # React Todo App

 ##  Dependencies
 - packer (https://www.packer.io)
 - terraform (https://www.terraform.io)
 - puppet
 - an AWS account

 ## Development
 - `yarn && yarn start` to view dev server
 - `yarn run dev` to spin up dev server
 - add `172.31.0.201 todoapp.com` to `/etc/hosts`
 - visit http://todoapp.com to see centos machine with your app running on it
 
 ## Deployment
  - build a new AMI via `yarn run pack`
  - deploy to an AWS auto scaling group via `# coming soon, see network architecture proposal`
