#!/bin/bash

cd /var/lib/jenkins/workspace/pipeline-K8s/terraform
terraform init
terraform apply -auto-approve

echo  "Aguardando a criação das maquinas ..."
sleep 5

ID_M1_DNS=$(terraform output aws_instance_e_ssh | cut -b 2- | rev | cut -b 2- | rev)
echo $ID_M1_DNS

echo "
[ec2-k8s]
$ID_M1_DNS
" > /var/lib/jenkins/workspace/pipeline-K8s/ansible/hosts

echo  "Aguardando ..."
sleep 15


