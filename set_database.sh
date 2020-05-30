#!/usr/bin/env bash

#######################################################
#
# MARIADB INSTALL
# ref : https://mariadb.com/resources/blog/installing-mariadb-10-on-centos-7-rhel-7/
# ref : https://mariadb.com/kb/en/mysql_secure_installation/
#
#######################################################

if [ ! -e "/etc/yum.repos.d/mariadb.repo" ]
then
       wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
       chmod +x mariadb_repo_setup
       sudo ./mariadb_repo_setup
       rm -f ./mariadb_repo_setup
fi

sudo yum install MariaDB-server
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

sudo mysql_secure_installation
