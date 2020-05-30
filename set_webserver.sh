#!/usr/bin/env bash

#####################################################
#
# NGINX INSTALL
# ref : https://www.nginx.com/resources/wiki/start/topics/tutorials/install/
#
#####################################################

## 저장소 생성 
sudo cp template/nginx.repo /etc/yum.repos.d/nginx.repo
sudo chown root:root /etc/yum.repos.d/nginx.repo

# 설치
sudo yum -y install nginx
sudo cp template/nginx.conf /etc/nginx/nginx.conf
sudo chown root:root /etc/nginx/nginx.conf

# 웹서버 시작 및 등록
sudo systemctl start nginx
sudo systemctl enable nginx

# 방화벽오픈 
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --reload
