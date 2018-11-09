#!/bin/bash

###################
# Install git #
#apt-get install git mc -y
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

ansible-playbook gen_conf.yml
echo "Please wait..."
ansible-playbook main.yml &> /dev/null
CNF=$(cat  /root/doublevpn/wg-client.conf);
rm -R /root/install.sh
echo  "Please copy this content to your TunSafe configuration file"
echo "#####################################################################################################################"
echo ""
echo "$CNF"
echo ""
echo "#####################################################################################################################"
rm -R /root/doublevpn
