#!/bin/bash
#   ANSI CODE   ##################################################################
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'
############################################################################
sudo -u batan bash /home/batan/check/caps.sh
ddd=$(date +%j)
clear
ddd=$(date +%j)
#mkdir -p $HOME/.config/nvim/pack/plugins/start/
#mkdir -p $HOME/.config/nvim/templates/
#mkdir -p $HOME/.vim/templates
#mkdir -p $HOME/.vim/pack/plugins/start/

clear
############################################################################

if [[ -f $HOME/.musik.kdl ]]; then
	mv $HOME/.musik.kdl $HOME/.musik.kdl.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/musik.kdl $HOME/.musik.kdl
else
	cp -r $HOME/dot/musik.kdl $HOME/.musik.kdl
fi
############################################################################

if [[ -f $HOME/.pod.opml ]]; then
	mv $HOME/.pod.opml $HOME/.pod.opml.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/pod.opml $HOME/.pod.opml
else
	cp -r $HOME/dot/pod.opml $HOME/.pod.opml
fi
############################################################################
if [[ -d /home/batan/.cache/calendar.vim ]]; then
cp dot/credentials/tel.petar.credentials.vim  /home/batan/.cache/calendar.vim/credentials.vim
else
mkdir /home/batan/.cache/calendar.vim/
cp dot/credentials/tel.petar.credentials.vim /home/batan/.cache/calendar.vim/credentials.vim
fi
clear
############################################################################

if [[ -f $HOME/.bashrc ]]; then
	mv $HOME/.bashrc $HOME/.bashrc.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/bashrc $HOME/.bashrc
else
	cp -r $HOME/dot/bashrc $HOME/.bashrc
fi
############################################################################
if [[ -f $HOME/.bashrc.aliases ]]; then
	mv $HOME/.bashrc.aliases $HOME/.bashrc.alaises.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/bashrc.aliases $HOME/.bashrc.aliases
else
	cp -r $HOME/dot/bashrc.aliases $HOME/.bashrc.aliases
fi
############################################################################

if [[ -f $HOME/.vimrc ]]; then
	mv $HOME/.vimrc $HOME/.vimrc.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/vimrc $HOME/.vimrc
else
	cp -r $HOME/dot/vimrc $HOME/.vimrc
fi
############################################################################

if [[ -f $HOME/.taskrc ]]; then
	mv $HOME/.taskrc $HOME/.taskrc.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/taskrc $HOME/.taskrc
else
	cp -r $HOME/dot/taskrc $HOME/.taskrc
fi
############################################################################

if [[ -f $HOME/.xboardrc ]]; then
	mv $HOME/.xboardrc $HOME/.xboardrc.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/xboardrc $HOME/.xboardrc
else
	cp -r $HOME/dot/xboardrc $HOME/.xboardrc
fi
############################################################################

if [[ -f $HOME/.tkremind ]]; then
	mv $HOME/.tkremind $HOME/.tkremind.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/tkremind $HOME/.tkremind
else
	cp -r $HOME/dot/tkremind $HOME/.tkremind
fi
############################################################################

if [[ -f $HOME/.xterm.conf ]]; then
	mv $HOME/.xterm.conf $HOME/.xterm.conf.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/xterm.conf $HOME/.xterm.conf
else
	cp -r $HOME/dot/xterm.conf $HOME/.xterm.conf
fi
############################################################################
if [[ -f $HOME/.Xresources ]]; then
	mv $HOME/.Xresources $HOME/.Xresources.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/Xresources $HOME/.Xresources
else
	cp -r $HOME/dot/Xresources $HOME/.Xresources
fi
############################################################################
if [[ -f $HOME/.bash_profile ]]; then
	mv $HOME/.bash_profile $HOME/.bash_profile.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/bash_profile $HOME/.bash_profile
else
	cp -r $HOME/dot/bash_profile $HOME/.bash_profile
fi
############################################################################
	if [[ -f $HOME/.tmux.config ]]; then
	mv $HOME/.tmux.config $HOME/.tmux.config.bak.$ddd.$(date +%H:%M)
	cp -r $HOME/dot/tmux.config $HOME/.tmux.config
else
	cp -r $HOME/dot/tmux.config $HOME/.tmux.config
fi
############################################################################

if [[ -f .vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl ]]; then
	mv $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp.$ddd.$(date +%H:%M)
	cp $HOME/dot/default.tlp $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp
fi
############################################################################
if [[ -f /etc/hosts ]]; then
sudo mv /etc/hosts /etc/hosts.original.$ddd.$(date +%H:%M)
	sudo cp -r $HOME/dot/hosts /etc/hosts
else
	sudo cp  $HOME/dot/hosts /etc/hosts
fi
############################################################################

/usr/bin/lc-caps
/usr/bin/lc-startup-script
clear
source ~/.bashrc
echo -e ${Purple}'<<<'${Cyan}'--------------------------------------------'${Purple}'>>>'
echo -e ${Green}'      Following files have been setup:'
echo -e ${Yellow}'<<<'${Cyan}'--------------------------------------------'${Yellow}'>>>'
echo -e '     bashrc, bashrc.aliases, vimrc, taskrc '
echo -e '     xboardrc, tkremind xterm.conf, .Xresources '
echo -e '     .bash_profile, .tmux.config, '
echo -e '     .config/featherpad, vimwiki2HTML-template'${Blue}
read -n1 -p "          Enter [any] to Exit" xxx


