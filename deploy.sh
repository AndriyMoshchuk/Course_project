#!bin/bash

set -e

terraform -chdir=./mysql-terraform init
terraform -chdir=./mysql-terraform apply -auto-improve

echo "$(terraform -chdir=./mysql-terraform output -raw kube_config)" > kube_connect.yml

export KUBECONFIG=kube_connect.yml 

kubectl apply -f mysql-kube/

external_ip=""
while [ -z $external_ip ]; do
    sleep 10
    external_ip=$(kubectl get svc phpmyadmin-service --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
done
echo $external_ip