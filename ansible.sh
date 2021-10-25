cd /var/lib/jenkins/workspace/pipeline-K8s/ansible

ANSIBLE_OUT=$(ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa)

echo $ANSIBLE_OUT

