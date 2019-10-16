#!/bin/bash

a=1

while IFC= read -r line
do

sudo useradd "${line%% *}$a"


if [ $a -lt 30 ]
then

sudo usermod -a -G Staff "${line%% *}$a"

elif [ $a -gt 30 ] && [ $a -lt 60 ]
then
sudo usermod -a -G Dev "${line%% *}$a"

elif [ $a -gt 60 ] && [ $a -lt 90 ]
then
sudo usermod -a -G Admin "${line%% *}$a"

elif [ $a -gt 90 ]
then
sudo usermod -a -G Temp "${line%% *}$a"

fi

((a++))



done < /home/Sean/Files/UserNamesLvl2.txt
