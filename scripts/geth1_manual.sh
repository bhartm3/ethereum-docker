#!/bin/sh
datadir=/root/.ethereum/geth1
[ -d $datadir ] || mkdir $datadir
bootnode_enode_id=`cat /root/.ethereum/bootnode/bootnode.log | cut -d "@" -f 1 | cut -d "=" -f 2`
bootnode_ip=`cat /root/.ethereum/bootnode/bootnode_ip.txt`
bootnode_enode="$bootnode_enode_id@$bootnode_ip:30301"
echo $bootnode_enode

case "$1" in

 basic)
	geth --datadir "$datadir" --networkid 271093 --bootnodes "$bootnode_enode" --port "30302" --maxpeers "3" --identity "geth1" console 2>> /root/.ethereum/geth1/console.log
	;;

 mine)
	geth --datadir "$datadir" --networkid 271093 --bootnodes "$bootnode_enode" --port "30302" --maxpeers "3" --identity "geth1" --mine --minerthreads=1 --etherbase=0x0000000000000000000000000000000000000000 console 2>> /root/.ethereum/geth1/console.log
	;;

 custom)
	echo "enter custom options:"
	read options
        geth --datadir "$datadir" --networkid 271093 --bootnodes "$bootnode_enode" --port "30302" --maxpeers "3" --identity "geth1" $options console 2>> /root/.ethereum/geth1/console.log
	;;
   *)
	echo "no option specified: basic|mine|custom"
	exit 0 
esac
