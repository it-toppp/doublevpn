#!/bin/bash

###################
# Install git #
apt-get install git mc -y
###################
# Install ansible #
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    apt-get update
    apt-get install software-properties-common ansible git python-apt -y
else
    echo "Ansible already installed"
fi

git clone https://github.com/it-toppp/doublevpn.git && cd /root/doublevpn/
#####################################
# Display real installation process #
chmod +x ./install.sh
echo "######################################################################################################################################"
echo ""
echo " Please go to the "doublevpn" directory and edit the "srv" file according to the template."
echo " Then run install.sh"
echo ""
echo "######################################################################################################################################"

