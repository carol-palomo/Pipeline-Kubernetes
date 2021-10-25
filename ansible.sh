cd /var/lib/jenkins/workspace/pipeline-K8s/ansible

ANSIBLE_OUT=$(ansible-playbook -i hosts teste.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa)

echo $ANSIBLE_OUT

STATUS_K8S=$(echo $ANSIBLE_OUT | grep -oE "(kubeadm version.*?.*?)'")


if [[ -z $STATUS_K8S ]]
then 
    echo "::::: kubernetes nao esta instalado :::::"
    exit 1
else
    echo "::::: kubernetes instalado :::::"
    exit 0
fi
