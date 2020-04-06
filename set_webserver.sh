#!/usr/bin/env bash

#####################################################
#
# NGINX INSTALL
# ref : https://www.nginx.com/resources/wiki/start/topics/tutorials/install/
# ref : https://www.getpagespeed.com/server-setup/nginx/how-to-install-latest-stable-nginx-on-rhel-8-centos-8-properly
# ref : https://linuxconfig.org/install-nginx-on-redhat-8
#
#####################################################

echo "[nginx]
name=nginx repo
releasever=8
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=0
enabled=1" > /etc/yum.repos.d/nginx.repo

# disable appstream
dnf --disablerepo=AppStream -y install nginx

systemctl start nginx
systemctl enable nginx

# firewall open
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
