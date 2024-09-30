#!/usr/bin/env sh


Green='\033[0;32m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
NC='\033[0m'

# Create a temporary script file
TMP_SCRIPT=$(mktemp /tmp/countdown_script.XXXXXX)
cat << 'EOL' > "$TMP_SCRIPT"
#!/bin/bash
#############################################################
#name: Vim COmmands shell
#description:	 Vim Integreted Menu
#				 _aims at intergrating Project Management 
#				 tools and improving workflow efficency_
#author: Fairdinkum Batan
#date: 034
#############################################################


 #/bin/bash


		E='echo -e';e='echo -en';trap "R;exit" 2
		ESC=$( $e "\e")
		TPUT(){ $e "\e[${1};${2}H";}
		CLEAR(){ $e "\ec";}
		CIVIS(){ $e "\e[?25l";}
		DRAW(){ $e "\e%@\e(0";}
		WRITE(){ $e "\e(B";}
		MARK(){ $e "\e[7m";}
		UNMARK(){ $e "\e[27m";}
		R(){ CLEAR ;stty sane;$e "\ec\e[30;42m\e[J";};
		HEAD(){ DRAW
			for each in $(seq 1 20);do
			$E " x                    x"
			done
			WRITE;MARK;TPUT 1 3
			$E "  VIM Proj Manage   ";UNMARK;}
			i=0; CLEAR; CIVIS;NULL=/dev/null
			FOOT(){ MARK;TPUT 20 3
			printf " Privacy Matters    ";UNMARK;}
			ARROW(){ read -s -n3 key 2>/dev/null >&2
			if [[ $key = $ESC[A ]];then echo up;fi
			if [[ $key = $ESC[B ]];then echo dn;fi;}

		M0(){ TPUT 3 10; $e "xxx";}
    	M1(){ TPUT 4 10; $e "xxx";}
    	M2(){ TPUT 5 10; $e "xxx";}
    	M3(){ TPUT 6 10; $e "xxx";}
    	M4(){ TPUT 7 10; $e "xxx";}
    	M5(){ TPUT 8 10; $e "xxx";}
		M6(){ TPUT 9 10; $e "xxx";}
		M7(){ TPUT 10 10; $e "xxx";}
		M8(){ TPUT 11 10; $e "xxx";}
		M9(){ TPUT 12 10; $e "xxx";}
        M10(){ TPUT 13 10; $e "xxx";}
        M11(){ TPUT 14 10; $e "xxx";}
        M12(){ TPUT 15 10; $e "xxx";}
        M13(){ TPUT 16 10; $e "xxx";}
        M14(){ TPUT 17 10; $e "xxx";}
        M15(){ TPUT 18 10; $e "Exit";}
		    LM=15
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
   POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
	REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
	INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
	while [[ "$O" != " " ]]; do case $i in
0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
7) S=M7;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
8) S=M8;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
9) S=M9;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
10) S=M10;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
11) S=M11;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
12) S=M12;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
13) S=M13;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
14) S=M14;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo -u batan bash)\n";ES;fi;;
15) S=M15;SC;if [[ $cur == "" ]];then R;exit 0;fi;;

	esac;
	POS;
done

EOL
cd $HOME/check/
/usr/bin/xterm -geom 50x40+0+0 -e "sudo -u batan bash $TMP_SCRIPT"
