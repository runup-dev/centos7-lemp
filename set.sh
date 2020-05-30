#!/usr/bin/env bash

timedatectl set-timezone Asia/Seoul     # TIMEZONE SET 
sudo yum update -y			# PACKAGE UPDATE
sudo ./set_user.sh			# SUDO USER CREATE
sudo ./set_webserver.sh			# INSTALL WEB SERVICE ( NGINX )
sudo ./set_database.sh			# INSTALL DATABASE ( MARIADB ) 
sudo ./set_php.sh			# INSTALL PHP 
sudo ./set_package.sh                   # INSTALL OTHER PACKAGE
