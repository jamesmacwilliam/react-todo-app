packer build -machine-readable aws/packer.json | tee build.log
grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2 | awk '{print "ami = \""$1"\""}' > aws/terraform.tfvars 2>&1
