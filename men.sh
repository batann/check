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
		R(){ CLEAR ;stty sane;$e "\ec\e[30;47m\e[J";};
		HEAD(){ DRAW
		ARROW(){ read -s -n3 key 3>/dev/null >&2
	    if [[ $key = $ESC[C ]];then echo right;fi
	    if [[ $key = $ESC[D ]];then echo left;fi;}
			M0(){ TPUT 0 13; $e "lc-snapshot";}
	    	M1(){ TPUT 0 26; $e "lc-menu";}
	    	M2(){ TPUT 0 39; $e "lc-usb";}
	    	M3(){ TPUT 0 52; $e "lc-remote";}
	    	M4(){ TPUT 0 65; $e "lc-scp";}
	    	M5(){ TPUT 0 78; $e "lc-tar";}
			M6(){ TPUT 0 81; $e "lc-task";}
			M7(){ TPUT 0 94; $e "xxxxx";}
	        M8(){ TPUT 0 107; $e "EXIT";}
		    LM=8

	MENU(){ for each in $(seq 0 $LM); do M${each}; done;}
	POS(){ if [[ $cur == right ]];then ((i++));fi
		    if [[ $cur == left ]];then ((i--));fi
    		if [[ $i -lt 0 ]]; then i=$LM;fi
			if [[ $i -gt $LM ]]; then i=0;fi}
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
0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-snapshot)\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-menu)\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-usb)\n";ES;fi;;
2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-remote)\n";ES;fi;;
3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-scp)\n";ES;fi;;
4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-tar)\n";ES;fi;;
5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-task)\n";ES;fi;;
6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$(/usr/bin/lc-task)\n";ES;fi;;
7) S=M8;SC;if [[ $cur == "" ]];then R;exit 0;fi;;

	esac;
	POS;
done
