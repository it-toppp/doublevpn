#!/bin/bash

CNF=$(cat  /root/doublevpn/wg-client.conf);

#####################################
# Display real installation process #

cd ./doublevpn
ansible-playbook gen_conf.yml
ansible-playbook main.yml
echo  "Please copy this content to your TunSafe configuration file"
echo "######################################################################################################################################"
echo ""
echo " $CNF"
echo ""
echo "#######################################################################################################################################"

