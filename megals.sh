#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################
clear
options=$(megals|grep -v 'Inbox'|grep -v 'Contac'|grep -v '12982@tu'|grep -v 'Trash'|grep -v 'WARNING'); select file in ${options[@]}; do megaget $file && clear ;done

