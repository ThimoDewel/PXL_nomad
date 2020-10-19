#!/bin/bash

#isntall yum utils
sudo yum install -y yum-utils

#add hasicorp & docker repo 
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#install nomad, consul and docker
sudo yum -y install nomad
sudo yum -y install consul
sudo yum -y install docker-ce docker-ce-cli containerd.io


#enable and start all services
sudo systemctl enable docker
sudo systemctl stop docker

sudo systemctl enable consul
sudo systemctl stop consul

sudo systemctl enable nomad
sudo systemctl stop nomad

#end of setup
echo =====================================================
echo $HOSTNAME setup finished
echo =====================================================