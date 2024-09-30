#!/bin/bash
#xfce4-terminal --geometry=80x40+0+0 -e 'sudo bash /home/batan/10/postinstall/

sudo ipcrm -M 12345
yad --plug=12345 --tabnum=1 --text="Weapons of PostInstallation!!!" --boarders=10 --columns="5" --form &> res1 &\
yad --plug=12345 --tabnum=2 --text="Software" --borders=30 --columns=5 --form \
--field="APT":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/repository.sh'" \
--field="Vim":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/vim.sh '" \
--field="Nvim":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/nvim.sh '" \
--field="Flatpak":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/flatpak.sh'" \
--field="Gitthub":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/github.sh'" \
--field="Progresss":fbtn "xterm -geom 100x40-320-0 -e bash -c 'sudo -u batan bash /home/batan/check/progress.sh'" &> res2 & \
yad --plug=12345 --tabnum=3 --text="Agenda" --boarders=10 --calendar &> res3 & \
yad --plug=12345 --tabnum=4 --columns=4  --form --text="Common Post Installation Settings" &> res4 & \
yad --plug=12345 --tabnum=5 --text="Editor" --html --browser --uri="file:///media/batan/200/189/real-time-html-css-editor/index.html" &> res5 & \
yad --plug=12345 --tabnum=6 --text="Movies" --html --browser --uri="file:///media/batan/200/189/Player/index.html" &> res6 & \
yad --plug=12345 --tabnum=7 --text="Home" --html --browser --uri="file:///home/batan/LC/homepage/d.html" &> res7 & \
yad --plug=12345 --tabnum=8 --text="Settings" --borders=10 --columns=5 --form \
--field="Set TimeZone ":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash timezone.sh'" \
--field="Set PowerManager ":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash powermanager.sh'" \
--field="Set SnapWindow":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash snapwindow.sh'" \
--field="Set KeyBindings ":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash keybinding.sh'" \
--field="Set Firewall ":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash firewall.sh'" \
--field="Set XXX":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash mega.sh'" \
--field="Set Visudo":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash visudo.sh'" \
--field="Set Gpg":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash gpg.sh'" \
--field="Set SSH":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash ssh.sh'" \
--field="Set FontsThemes":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash fonts.sh'" \
--field="Set Themes":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash themes.sh'" \
--field="Set CapsLock":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash /homer/batan/check/caps.sh'" \
--field="Set SuperKey":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash superkey.sh'" & > res8 & \
yad --plug=12345 --tabnum=9 --text="Commands" --borders=10 --columns=5 --form \
--field="Update":fbtn "sudo apt update && sudo apt upgrade"  \
--field="Clean":fbtn "xterm -geom 50x40+0-0 -e 'sudo -u batan bash clean.sh'"  \
--field="Shred":fbtn "xterm -geom 50x40+0-0 -e 'sudo -u batan bash shred.sh'"  \
--field="Nuke":fbtn "xterm -geom 50x40+0-0 -e 'sudo -u batan bash nuke.sh'"  \
--field="Update-Grub":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo update-grub'"  \
--field="SetSSH":fbtn "xterm  -geom 50x30+0+0 -e bash -c 'sudo -u batan bash setssh.sh'"  \
--field="SCPlocal ":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash scplocal.sh'" \
--field="xxx":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash'"  \
--field="Fstab":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash fstab.sh'"  \
--field="FormatUSB":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash usb.sh'"  \
--field="xxx":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash'"   \
--field="xxx":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash'"   \
--field="xxx":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash'"   \
--field="Cloud":fbtn "xterm -geom 50x40+0-0 -e 'sudo -u batan bash /home/batan/check/megals.sh'" \
--field="DashStartRight":fbtn "xterm -geom 50x40+0-0 -e bash -c 'sudo -u batan bash start_right.sh'" \
--field="DownloadMP4":fbtn "xfce4-terminal --geometry=100x10+100+100 --hide-borders --hide-menubar --hide-scrollbar --zoom=-1 -e 'sudo -u batan bash /home/batan/check/downv.sh'"  \
--field="DownloadMP3":fbtn "xfce4-terminal --geometry=100x10+100+100 --hide-borders --hide-menubar --hide-scrollbar --zoom=-1 -e 'sudo -u batan bash /home/batan/check/downm.sh'" & > res9 & \
yad --plug=12345 --tabnum=10 --text="Bookmarks" --html --browser --uri="html/bookmarks/bookmarks.html" &> res10 & \
yad --plug=12345 --tabnum=11 --text="Usefull Links" --columns=4 --form  \
 --field="CoverYourTracks":fbtn "falkon https://coveryourtracks.eff.org/" \
 --field="BrowserLeaks":fbtn "falkon https://browserleaks.com/" &> res11 & \

 yad --notebook --key=12345 --width=700 --height=500 --title="Your Friendly AI 2.0" --center --text="A little something something to make the Post Installation Conandrum a littlebit easier!!!" --borders=10 --image-on-top --image="/home/batan/10/postinstall/yad.png" --buttons-layout="spread" --button="Two!c10" --button="Firefox!firefox" --button="Ungoogled Chromium!/usr/share/icons/ePapirus/16x16/categories/chrome-ighkikkfkalojiibipjigpccggljgdff-Default.svg" --button="Xboard Chess!/usr/share/icons/ePapirus/16x16/categories/xboard.svg" --tab-borders=10 --tab-pos=left --tab="Welcome" --tab="Software" --tab="Calendar" --tab="Settings" --tab="Aptitute" --tab="Entertainment" --tab="Home" --tab="Clock" --tab="Usefull Links" --tab="ChatGPT" --tab="Usefull Links"

fi
sudo trash res*
sudo ipcrm -M 12345

