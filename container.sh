docker build -t test -f Dockerfile .
cd dev_aks && terraform apply
open http://127.0.0.1:8081
