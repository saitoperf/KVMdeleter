#!/bin/bash

SNAPSHOTS=`sudo virsh list --all | sed -e '1,2d' -e '\$d' | tr -s ' ' | cut -f 3 -d ' '`

if [ "$1" = '' ]; then
    echo 'Usage: ./delSnap.sh <VM NAME>'
    echo 'Exsistin VMs: '
    echo $SNAPSHOTS
else
    if echo $SNAPSHOTS | grep -q "$1"; then
        for Var in `sudo virsh snapshot-list $1 | sed  -e '1,2d' -e '$d' | cut -f 2 -d " " `
        do
            sudo virsh snapshot-delete $1 $Var
        done
    else
        echo "'$1' does not exist"
        echo 'Usage: ./delSnap.sh <VM NAME>'
        echo 'Exsistin VMs: '
        echo $SNAPSHOTS
    fi
fi