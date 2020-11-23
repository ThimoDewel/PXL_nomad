#!/bin/bash

#isntall yum utils
sudo yum install -y yum-utils

#add hasicorp & docker repo 
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#install nomad, consul, docker and sshpass
sudo yum -y install nomad
sudo yum -y install consul
sudo yum -y install docker-ce docker-ce-cli containerd.io
sudo yum -y install sshpass



#enable and stop all services
sudo systemctl enable docker
sudo systemctl stop docker

sudo systemctl enable consul
sudo systemctl stop consul

sudo systemctl enable nomad
sudo systemctl stop nomad


#change sshd_service
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

#end of setup
echo =====================================================
echo $HOSTNAME setup finished
echo =====================================================