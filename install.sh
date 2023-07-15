#!/bin/bash
echo off
clear
echo Chameleon Internet-Based Setup

#Proceed with Installation

clear
echo Preparing Installer

uninstall() {
REBO=ACTIVE
i=1
sp="/-\|"
echo -n ' '
clear
printf 'Removing...\n'
while [ REBO == ACTIVE ]
do
  printf "\b${sp:i++%${#sp}:1}"

done
sudo rm -r ~/.Chameleon

}

prepareInstall() {
    
if [~/.Chameleon]
then
rm -r ~/.Chameleon
fi

mkdir ~/.Chameleon
cd ~/.Chameleon
mkdir ~/.Chameleon/.core
ls -A > ~/.Chameleon/.core/dirsetup.czco
sudo apt update
sudo apt upgrade -y
clear
printf "Installing Packages...\n"
sudo apt install whiptail -y
sudo apt install perl -y
sudo apt install python3 -y


OOBE=ACTIVE
i=1
sp="/-\|"
echo -n ' '
clear
printf 'Installing...\n'
while [ OOBE == ACTIVE ]
do
  printf "\b${sp:i++%${#sp}:1}"

done
}
startInstall(){
mkdir ~/.Chameleon
curl -O "https://raw.githubusercontent.com/NateYeet/Chameleon/main/Chameleon/VerboseBootloader.bin" > ~/.Chameleon/.core/VerboseBootloader.bin
curl -O "https://raw.githubusercontent.com/NateYeet/Chameleon/main/Chameleon/Benvabuntu-Chameleon.czco" > ~/.Chameleon/.core/.benvarc
curl -O "https://raw.githubusercontent.com/NateYeet/Chameleon/main/install.sh" > ~/.Chameleon/.core/.remo-czco.sh && chmod u+x ~/.Chameleon/.core/.remo-czco.sh


{
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Waiting for service..." 6 50 0
clear
printf "Phase 1 Complete \n" 
Boot=$(cat ~/.Chameleon/.core/VerboseBootloader.bin |  tr -d "\r" |perl -lpe '$_=pack"B*",$_')
Benvabuntu=$(cat ~/.Chameleon/.core/.benvarc |  tr -d "\r")
echo $Boot | sudo bash
echo $Benvabuntu >> ~/.bashrc
clear
printf "Installed Bootloader Data \n"
printf "\n Phase 2 Complete"

}

read -r -p "[1]Standard Install [2]Custom Install [3] Uninstall " response
case "$response" in
    [1]) 
        prepareInstall;
        startInstall;
        ;;
    [2])
        exit
        ;;
    [3])
        uninstall;
        ;;
    *)
        sudo ./install.sh
        ;;
esac
