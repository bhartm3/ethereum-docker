#!/bin/bash
basedir=/root/ethereum
[ -d $basedir ] || echo "ERROR: $basedir not existent"
[ -d $basedir/bootnode ] || mkdir $basedir/bootnode
echo "Generating boot key.."
/usr/bin/bootnode --genkey=/root/ethereum/bootnode/boot.key && echo "Generated boot key successfully"
ip a | grep eth0 |  grep inet | cut -d " " -f 6 | cut -d "/" -f 1 > $basedir/bootnode/bootnode_ip.txt
/usr/bin/bootnode --nodekey=/root/ethereum/bootnode/boot.key > /root/ethereum/bootnode/bootnode.log 2>&1
