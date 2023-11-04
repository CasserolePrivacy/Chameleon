#!/bin/bash
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
echo Chameleon Internet-Based Setup
sleep 5
#Proceed with Installation
version="Pre-Release"

if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
echo Preparing Installer

uninstall() {
delete=$(whiptail --yesno "This will delete your Chameleon information. Continue?" 0 0 3>&1 1>&2 2>&3 --title Uninstall --defaultno; echo $?)
if [[ $delete == 0 ]]; then
REBO=ACTIVE
i=1
sp="/-\|"
echo -n ' '
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
printf 'Removing...\n'
while [ REBO == ACTIVE ]
do
  printf "\b${sp:i++%${#sp}:1}"

done

sudo rm /usr/local/bin/chameleon
else
exit 400
fi
exit 205
}
preguntar(){
    optionsarray=("Install" "Uninstall" "Quit")
select response in "${optionsarray[@]}"
do
case $response in
    "Install") 
        prepareInstall;
        startInstall;
        ;;
    "Uninstall") 
        uninstall; 
        ;; 
    "Quit")
        exit 205;
        ;;
    *) 
        sudo ./install.sh 
        ;; 
esac;
done
}

prepareInstall() {
    
if ! [[ /var/.Chameleon ]]
then
rem 1
else
sudo rm -r /var/.Chameleon
fi

sudo mkdir /var/.Chameleon
sudo chown "$USER" /var/.Chameleon
cd ~
sudo mkdir /var/.Chameleon/.core
ls -A > /var/.Chameleon/.core/dirsetup.czco
sudo apt update
sudo apt upgrade -y
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
printf "Installing Packages...\n"
sudo apt install whiptail -y
sudo apt install perl -y
sudo apt install python3 -y
sudo cp ~/.bashrc /var/.Chameleon/.core/bashrc-backup.czco
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear

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
fi
}
startInstall(){
sudo rm /usr/local/bin/chameleon
sudo mkdir /var/.Chameleon
sudo curl -fsSL "https://raw.githubusercontent.com/NateYeet/Chameleon/main/Chameleon/VerboseBootloader.bin" > /var/.Chameleon/.core/VerboseBootloader.bin
sudo curl -fsSL "https://raw.githubusercontent.com/NateYeet/Chameleon/main/Chameleon/Benvabuntu-Chameleon.som" > /var/.Chameleon/.core/.benvarc
sudo curl -fsSL "https://raw.githubusercontent.com/NateYeet/Chameleon/main/Chameleon/main.czco" |  tr -d "\r"  >> /usr/local/bin/chameleon && sudo chmod +x /usr/local/bin/chameleon



{
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Waiting for service..." 6 50 0
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
printf "Phase 1 Complete \n" 
Boot=$(sudo cat /var/.Chameleon/.core/VerboseBootloader.bin |  tr -d "\r" |perl -lpe '$_=pack"B*",$_')
Benvabuntu=$(sudo cat /var/.Chameleon/.core/.benvarc |  tr -d "\r")
echo "$Boot" | sudo bash
echo "$version" >> /var/.Chameleon/.core/sysmd
if [[ $1 == "-v" ]]; then
    echo "VerboseSkip"

    else
    clear
fi
printf "Installed Bootloader Data\n"
printf "\nPhase 2 Complete\n"
exit 1
}
if [[ $1 == "-i" ]]; then
    prepareInstall;
    startInstall;
fi
if [[ $1 == "-u" ]]; then
    uninstall;
fi
if ! [[ $1  ]]; then
    preguntar;
fi

