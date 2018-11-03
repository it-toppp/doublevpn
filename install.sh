#!/bin/bash

#####################################
# Display real installation process #

cd /root/doublevpn
ansible-playbook gen_conf.yml
CNF=$(cat  /root/doublevpn/wg-client.conf);
ansible-playbook main.yml
echo  "Please copy this content to your TunSafe configuration file"
echo "######################################################################################################################################"
echo ""
echo " $CNF"
echo ""
echo "#######################################################################################################################################"

