#!/bin/bash

cd /var/lib/jenkins/workspace/pipeline-K8s/terraform
terraform destroy -auto-approve
