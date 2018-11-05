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

ansible-playbook gen_conf.yml
ansible-playbook main.yml
CNF=$(cat  /root/doublevpn/wg-client.conf);

echo  "Please copy this content to your TunSafe configuration file"
echo "######################################################################################################################################"
echo ""
echo "$CNF"
echo ""
echo "#######################################################################################################################################"
rm -R /root/doublevpn
