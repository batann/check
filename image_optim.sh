#!/bin/bash
#
#
#


clear
echo -e "Image type to be optimized:"
echo -e "---------------------------"
echo -e "   >>> 1) png"
echo -e "   >>> 2) jpg"
echo -e "---------------------------"
read  -p '   >>> ' abc
clear
if [[ $abc -eq 1 ]]; then
mkdir 1
mv *.png 1
cd 1
	for i in $(ls *.png);do optipng -o7 -zm1-9 $i && clear;done
else
	mkdir 1
	mv *.jpg 1
	cd 1
	for i in $(ls *.jpg);do optipng -o7 -zm1-9 $i && clear;done
	fi
	clear
	ls



