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
			for each in $(seq 1 33);do
			$E "   x                          x"
			done
			WRITE;MARK;TPUT 1 5
			$E "     Dirs to from MEGA    ";UNMARK;}
			i=0; CLEAR; CIVIS;NULL=/dev/null
			HEAD1(){ MARK;TPUT 3 5
			printf "  ======= HOME ========== ";UNMARK;}
			HEAD2(){ MARK;TPUT 9 5
			printf "  ======= .config  ====== ";UNMARK;}
			HEAD3(){ MARK;TPUT 20 5
			printf "  ======= xfce4 ========= ";UNMARK;}
			HEAD4(){ MARK;TPUT 25 5
			printf "  ======= xfconf ======== ";UNMARK;}
			HEAD5(){ MARK;TPUT 27 5
			printf "  ======== REST ========= ";UNMARK;}
			HEAD6(){ MARK;TPUT 31 5
			printf "  ======== EXIT ========= ";UNMARK;}
			FOOT(){ MARK;TPUT 33 5
			printf "     Privacy Matters      ";UNMARK;}
			ARROW(){ read -s -n3 key 2>/dev/null >&2
			if [[ $key = $ESC[A ]];then echo up;fi
			if [[ $key = $ESC[B ]];then echo dn;fi;}

		   	M0(){ TPUT 4 10; $e "10";}
	    	M1(){ TPUT 5 10; $e "11";}
	    	M2(){ TPUT 6 10; $e "100";}
	    	M3(){ TPUT 7 10; $e "check";}
	    	M4(){ TPUT 8 10; $e "backgrounds";}
		M5(){ TPUT 10 10; $e "autostart";}
		M6(){ TPUT 11 10; $e "castero";}
		M7(){ TPUT 12 10; $e "featherpad";}
		M8(){ TPUT 13 10; $e "Thunar";}
		M9(){ TPUT 14 10; $e "MX-Linux";}
		M10(){ TPUT 15 10; $e "gtk-2.0";}
		M11(){ TPUT 16 10; $e "gtk-3.0";}
		M12(){ TPUT 17 10; $e "menus";}
		M13(){ TPUT 18 10; $e "nvim";}
		M14(){ TPUT 19 10; $e "xfce-superkey";}
		M15(){ TPUT 21 10; $e "desktop";}
		M16(){ TPUT 22 10; $e "panel";}
		M17(){ TPUT 23 10; $e "terminal";}
		M18(){ TPUT 24 10; $e "xfwm4";}
		M19(){ TPUT 26 10; $e "xfce4-perchannel-xml";}
		M20(){ TPUT 28 10; $e "xxxxxx";}
		M21(){ TPUT 29 10; $e "yyyyyy";}
		M22(){ TPUT 30 10; $e "Menu3";}
	        M23(){ TPUT 32 10; $e "EXIT";}
		    LM=23
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
	INIT(){ R;HEAD;HEAD1;HEAD2;HEAD3;HEAD4;HEAD5;HEAD6;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
	while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/10 -r /home/batan/MEGA/10 )\n";ES;fi;;
  1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/11 -r /home/batan/MEGA/11 )\n";ES;fi;;
  2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/100 -r /home/batan/MEGA/100 )\n";ES;fi;;
  3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/check -r /home/batan/MEGA/check )\n";ES;fi;;
  4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/dot -r /home/batan/MEGA/dot )\n";ES;fi;;
  5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/autostart -r /home/batan/MEGA/config/autostart )\n";ES;fi;;
  6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/castero -r /home/batan/MEGA/config/castero )\n";ES;fi;;
  7) S=M7;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/featherpad -r /home/batan/MEGA/ )\n";ES;fi;;
  8) S=M8;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/Thunar -r /home/batan/MEGA/config/Thunar )\n";ES;fi;;
  9) S=M9;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/MX-Linux -r /home/batan/MEGA/ )\n";ES;fi;;
10) S=M10;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/gtk-2.0 -r /home/batan/MEGA/config/gtk-2.0 )\n";ES;fi;;
11) S=M11;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/gtk-3.0 -r /home/batan/MEGA/ )\n";ES;fi;;
12) S=M12;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/menus -r /home/batan/MEGA/config/menus )\n";ES;fi;;
13) S=M13;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/nvim -r /home/batan/MEGA/ )\n";ES;fi;;
14) S=M14;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce-superkey -r /home/batan/MEGA/config/xfce-superkey )\n";ES;fi;;
15) S=M15;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/desktop -r /home/batan/MEGA/ )\n";ES;fi;;
16) S=M16;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/panel -r /home/batan/MEGA/config/xfce4/panel )\n";ES;fi;;
17) S=M17;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/terminal -r /home/batan/MEGA/ )\n";ES;fi;;
18) S=M18;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/xfwm4/ -r /home/batan/MEGA/config/xfce4/xfwm4 )\n";ES;fi;;
19) S=M19;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/xconf/xfce4-perchannel-xml -r /home/batan/MEGA/ )\n";ES;fi;;
20) S=M20;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/ -r /home/batan/MEGA/ )\n";ES;fi;;
21) S=M21;SC;if [[ $cur == "" ]];then R;$e "\n$(cp -r /home/batan/.config/xfce4/ -r /home/batan/MEGA/ )\n";ES;fi;;
22) S=M22;SC;if [[ $cur == "" ]];then R;$e "\n$(sudo apt )\n";ES;fi;;
23) S=M23;SC;if [[ $cur == "" ]];then R;exit 0 sudo -u batan bash first.sh;fi;;

	esac;
	POS;
done

