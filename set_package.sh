## LEMP + WORDPRESS FOR PACKAGE INSTALL 
## author : KimTaeOh. 


# CLAMV 
# REF : https://www.clamav.net/documents/installing-clamav#rhel
function clamv_install(){
	echo "clamv install"
        sudo yum install -y epel-release
        sudo yum install -y clamav
}

# DROPBOX UPLOADER
# REF 
function dropbox_uploader_install(){
        echo "dropbox_uploader install"
        sudo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /usr/bin/dropbox_uploader
        sudo chmod 755 /usr/bin/dropbox_uploader
}

# WP-CLI
# REF : https://wp-cli.org/
function wp_cli_install(){
        echo "wp-cli install"
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	php wp-cli.phar --info
	chmod +x wp-cli.phar
	sudo mv wp-cli.phar /usr/local/bin/wp
}

# LETS ENCRYPT
# REF : https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/SSL-on-amazon-linux-ami.html#lets-encrypt-alami
function letsencrypt_install(){
        echo "let's encrypt install"
	#sudo yum-config-manager --enable epel
	wget https://dl.eff.org/certbot-auto
	sudo chmod a+x certbot-auto
	sudo ./certbot-auto --debug

	sudo mv ./certbot-auto /usr/bin
}


## COMMAND LINE INTERFACE
echo "Package Install"
echo "0) All Package Below"
echo "1) clamv"
echo "2) dropbox_uploader"
echo "3) wp-cli"
echo "4) let's encrypt"
read -p "[Package Number] " OPTION


case ${OPTION} in
  "0")
	# ALL PACKAGE
	clamv_install
	dropbox_uploader_install
	wp_cli_install
	letsencrypt_install
  ;;

  "1")
	# CLAMV
        clamv_install
  ;;

  "2")
	# DROPBOX_UPLOADER
        dropbox_uploader_install
  ;;

  "3")
	# WP-CLI
        wp_cli_install
  ;;


  "4")
	# LETS ENCRYPT
        letsencrypt_install
  ;;

  *)
	# INPUT WRONG NUMBER
        echo "wrong number" 
        exit    
  ;;
esac
