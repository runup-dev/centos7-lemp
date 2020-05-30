#!/usr/bin/env bash

sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils

sudo yum -y --enablerepo=remi-php73 install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pecl-imagick php-opcache php-pecl-ssh2

sudo systemctl start php-fpm
sudo systemctl enable php-fpm
