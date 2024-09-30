#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
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
ddd=$(date +%j)
#############################################################
bat=$(date +%j_%H_%M)
pwwd=$(pwd)
clear
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'
echo -e ${Yellow}'     Enter the extention please:'
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'${Green}
	read -p '   >>> ' abc

mkdir cleaned
cp *.$abc cleaned
cd cleaned
mat2 *.$abc
mkdir $HOME/${abc}_$bat
mv *.cleaned* $HOME/${abc}_$bat
cd ..
sudo trash cleaned
sudo trash *.$abc
cd $HOME/${abc}_$bat
for file in *; do
    mv "$file" "$(echo "$file" | sed 's/.cleaned//')"
done
# Step 7: Remove parentheses and content in between
rename 's/\(.*\)//' *
rename 's/\[.*\]//' *
rename 's/\".*\"//' *
rename "s/\'.*\'//" *
rename 's/[^\x00-\x7F]//g' *
# Step 9: If files are jpg, jpeg, or png, compress using ImageMagick
if [[ $ext == "jpg" || $ext == "jpeg" || $ext == "png" ]]; then
    for file in *; do
        convert "$file" -quality 80 "$(basename "$file" .$ext)_compressed.$ext"
mv "$file" "$(echo "$file" | sed 's/.compressed//')"
done
fi

counter=1
for file in *; do
    extension="${file##*.}"  # Get the file extension
    base_name="${file%.*}"  # Get the file name without extension

    # Shorten the file name to 10 characters
    shortened_name="${base_name:0:5}"

    # Append an incrementing number
    new_name="${shortened_name}_${counter}.$extension"

    mv "$file" "$new_name"
    ((counter++))
done
clear
echo -e "mv $HOME/${abc}_$bat/* . && sudo trash $HOME/${abc}_$bat"|xclip -selection clipboard

#rename 's/(.{10}).*(\..*)/$1$2/' *


echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'
echo -e ${Yellow}'         Files in: '
echo -e ${Green}               $HOME/${abc}_$bat
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'${Yellow}
ls
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'
echo -e "${Yellow}   >>>${While}   Remove the old files and move cleaned back?   ${Yellow}<<<"
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'
echo -e "             >>> 1) Yes"
echo -e "             >>> 2) No"
echo -e ${Cyan}'<<<'${Purple}'---------------------------------'${Cyan}'>>>'
read -p "             >>> " hhh
if [[ $hhh -eq 1 ]];
then
	sudo trash *.abc
	sudo trash *.cleaned

cp /home/batan/${abc}_$bat/* $pwwd
echo /home/batan/${abc}_$bat

#	dialog --title "DONE" --msgbox "DONE" 0 0
else
	echo ""
	exit 0
	fi


