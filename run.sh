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

echo "---- add slachtec.local urls to /etc/hosts ----"
ansible-playbook -i inventory/hosts plays/hostsfile.yml --verbose --ask-pass

echo "---- install customised jenkins ----"
ansible-playbook -i inventory/hosts plays/jenkins.yml --verbose

echo "---- modify VM minikube RAM ----"
ansible-playbook -i inventory/hosts plays/virtualbox.yml --verbose

echo "********** Ansible apply SUCCESS **********"
echo "script writtten by Yousef Sedky"
