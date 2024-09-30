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
			for each in $(seq 1 18);do
			$E "   x                          x"
			done
			WRITE;MARK;TPUT 1 5
			$E "     Usefull Software     ";UNMARK;}
			i=0; CLEAR; CIVIS;NULL=/dev/null
			FOOT(){ MARK;TPUT 18 5
			printf "     Privacy Matters      ";UNMARK;}
			ARROW(){ read -s -n3 key 2>/dev/null >&2
			if [[ $key = $ESC[A ]];then echo up;fi
			if [[ $key = $ESC[B ]];then echo dn;fi;}

		M0(){ TPUT 3 10; $e "x";}
	    	M1(){ TPUT 4 10; $e "x";}
	    	M2(){ TPUT 5 10; $e "x";}
	    	M3(){ TPUT 6 10; $e "x";}
	    	M4(){ TPUT 7 10; $e "x";}
	    	M5(){ TPUT 8 10; $e "x";}
		M6(){ TPUT 9 10; $e "x";}
		M7(){ TPUT 10 10; $e "x";}
		M8(){ TPUT 11 10; $e "x";}
		M9(){ TPUT 12 10; $e "Menu3";}
	        M10(){ TPUT 13 10; $e "EXIT";}
		    LM=10
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
0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
7) S=M7;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
8) S=M8;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
9) S=M9;SC;if [[ $cur == "" ]];then R;$e "\n$( )\n";ES;fi;;
10) S=M10;SC;if [[ $cur == "" ]];then R;exit 0 sudo -u batan bash first.sh;fi;;

	esac;
	POS;
done

