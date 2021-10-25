#!/bin/bash

cd terraform
terraform init
terraform apply -auto-approve

echo  "Aguardando a criação das maquinas ..."
sleep 5

ID_M1_DNS=$(terraform output aws_instance_e_ssh | cut -b 2- | rev | cut -b 2- | rev)
echo $ID_M1_DNS

echo "
[ec2-k8s]
$ID_M1_DNS
" > ../ansible/hosts

echo  "Aguardando ..."
sleep 15

cd /var/lib/jenkins/workspace/PipelineInfra/ansible
ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa
