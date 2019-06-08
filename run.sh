#!/usr/bin/env bash

echo "*********************************"
echo "*       SCRIPT STARTED          *"
echo "*********************************"

echo "----- Ansible apply started -----"
cd ansible
export ANSIBLE_CONFIG=configs/ansible.cfg

 echo "---- install minikube dependencies ----"
 ansible-playbook -i inventory/hosts plays/minikube-dependencies.yml --verbose

 echo "---- install minikube ----"
 ansible-playbook -i inventory/hosts plays/minikube.yml --verbose

 echo "---- deploy tiller server side for helm ----"
 ansible-playbook -i inventory/hosts plays/helm-tiller.yml --verbose

echo "---- install customised jenkins ----"
ansible-playbook -i inventory/hosts plays/jenkins.yml --verbose

echo "---- modify VM minikube RAM ----"
ansible-playbook -i inventory/hosts plays/virtualbox.yml --verbose

echo "---- install nginx proxy ----"
ansible-playbook -i inventory/hosts plays/hostsfile.yml --verbose

echo "********** Ansible apply SUCCESS **********"
echo "script writtten by Yousef Sedky"



# helm upgrade axiom-airports .  --set image.tag=1.1.0
# helm upgrade axiom-airports .  --set image.tag=1.0.1
# helm history
# helm list
#printf $(kubectl get secret --namespace default my-release-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
