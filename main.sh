#!/bin/bash
echo off
title CrOS Chameleon
clear
echo Chameleon Setup
mkdir Chameleon
cd Chameleon
dir > dirsetup.czco
sudo apt install whiptail

#Proceed with Installation

clear
echo Preparing Installer

prepareInstall() {
OOBE=ACTIVE
i=1
sp="/-\|"
echo -n ' '
clear
printf Installing...
while [ OOBE == ACTIVE ]
do
  printf "\b${sp:i++%${#sp}:1}"

done
}
startInstall(){
curl "https://raw.githubusercontent.com/NateYeet/Casserole/main/Bootloader/VerboseBootloader.binary" > VerboseBootloader.bin
{
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Waiting for service..." 6 50 0clear
printf "Phase 1 Complete"
}

read -r -p "[1]Standard Install [2]Custom Install" response
case "$response" in
    [1]) 
        prepareInstall;
        startInstall;
        ;;
    *)
        do_something_else
        ;;
esac