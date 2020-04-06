#!/usr/bin/env bash

#######################################################
#
# MARIADB INSTALL
# ref : https://mariadb.com/resources/blog/how-to-install-mariadb-on-rhel8-centos8/
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

sudo dnf install -y perl-DBI libaio libsepol lsof boost-program-options
sudo dnf install --disablerepo=AppStream --repo="mariadb-main" -y MariaDB-server

sudo mysql_install_db
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
sudo mysql_secure_installation
