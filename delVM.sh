#!/bin/bash

VMS=`sudo virsh list --all | sed -e '1,2d' -e '$d' | tr -s ' ' | cut -f 3 -d ' '`

for Var in $VMS
do
    sudo virsh destroy $Var
    sudo virsh undefine $Var
done