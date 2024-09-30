#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################
clear

if [[ -d /home/batan/.vim/templates ]];
then
	cp /home/batan/dot/templates/sklt* /home/batan/.vim/templates/
else
mkdir -p /home/batan/.vim/templates
	cp /home/batan/dot/templates/sklt* /home/batan/.vim/templates/
fi
if [[ -d  /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/ ]];
then
	mv  /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl
else
	mkdir /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/
	mv  /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl /home/batan/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl
fi
clear
tput cup 2 0
echo        "===================="
tput cup 0 0
echo        "    >>> DONE <<<"
read -n1 -p " Press [any] to exit" ccc
