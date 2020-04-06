#!/usr/bin/env bash

#####################################################
#
# CREATE SUPER USER
# ref : https://www.vultr.com/docs/how-do-i-generate-ssh-keys
# ref : https://gist.github.com/buchireddy/19eb6593f692852d2df7
# ref : https://www.vmotionhost.com/client-area/knowledgebase.php?action=displayarticle&id=197
# author : Runup. Kim Tae Oh
#
#####################################################

# CREATE USER
sudo_user=runup-user
userdel -r ${sudo_user}
useradd ${sudo_user}
#passwd ${sudo_user}

# GRANT SUDO
sudo_exists=$(sudo grep "${sudo_user} ALL=(ALL) NOPASSWD:ALL" /etc/sudoers)

if [ -z "$sudo_exists" ]
then
        # Take a backup of sudoers file and change the backup file.
        sudo cp /etc/sudoers /tmp/sudoers.bak
        sudo echo -e "\n${sudo_user} ALL=(ALL) NOPASSWD:ALL\nDefaults:${sudo_user} !requiretty" >> /tmp/sudoers.bak

        # Check syntax of the backup file to make sure it is correct.
        sudo visudo -cf /tmp/sudoers.bak
        if [ $? -eq 0 ]; then
                # Replace the sudoers file with the new only if syntax is correct.
                sudo cp /tmp/sudoers.bak /etc/sudoers
        else
                echo "Could not modify /etc/sudoers file. Please do this manually."
        fi
fi

# CREATE PRIVATE KEY
sudo mkdir -p /home/${sudo_user}/.ssh
sudo chmod 700 /home/${sudo_user}/.ssh
ssh-keygen -t rsa -b 4096 -f /home/${sudo_user}/.ssh/${sudo_user} -P "Runup@)9070"
sudo mv /home/${sudo_user}/.ssh/${sudo_user}.pub /home/${sudo_user}/.ssh/authorized_keys
sudo chmod 600 /home/${sudo_user}/.ssh/authorized_keys
sudo chown -R ${sudo_user}:${sudo_user} /home/${sudo_user}/.ssh

# DOWNLOAD CONFIRM
ip=$(sudo hostname -I | sed -e 's/^ *//g' -e 's/ *$//g')
echo "scp root@${ip}:/home/${sudo_user}/.ssh/${sudo_user} ./ssh"
echo "DOWNLOAD PRIVATE KEY ?"
while :
do
read -rp "Yes or No) " cf
case $cf in
        Yes)
                echo "Good!! please login ${sudo_user} And Setup"
                break
        ;;
        No)
                echo "exit"
                exit
        ;;
        *)
                echo "Please Input Yes or No !!!"
        ;;
esac
done

# PASSWORD LOGIN DISABLE
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

# ROOT LOGIN DISABLE
sudo sed -i "/^[^#]*PermitRootLogin[[:space:]]yes/c\PermitRootLogin no" /etc/ssh/sshd_config

sudo systemctl restart sshd
