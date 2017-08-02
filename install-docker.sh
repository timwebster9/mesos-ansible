#!/usr/bin/env bash

sudo yum install -y yum-utils device-mapper-persistent-data lvm2 container-selinux && \
sudo yum-config-manager \
       --add-repo \
       https://download.docker.com/linux/centos/docker-ce.repo && \
sudo yum makecache fast && \
sudo yum install -y docker-ce && \
sudo systemctl enable docker && \
sudo systemctl start docker