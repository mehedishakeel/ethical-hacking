#!/bin/bash


cat  <<  EOF 

  __________  __    _____   ____ __
 /_  __/ __ \/ /   /  _/ | / / //_/
  / / / /_/ / /    / //  |/ / ,<   
 / / / ____/ /____/ // /|  / /| |  
/_/ /_/   /_____/___/_/ |_/_/ |_|  

V2/V3  Driver Compile & Install on Kali Linux
YouTube : https://www.youtube.com/mehedishakeel
Developed By : Mehedi Shakeel
                                                                 
EOF

#Checking For Root Access
echo "Checking For Root User...."
sleep 2
if [[ $(id -u) -ne 0 ]] ; then 
   echo "You are Not Root! Please Run as root" ; exit 1 ; 
else echo "Ready To Go.." ; 
fi


sleep 2

PS3='Please enter your choice: '
options=("Install Wifi Driver" "Show Commands" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "After Installing Your Machine is Going to REBOOT"
            sudo apt-get update
            sudo apt-get install linux-image-$(uname -r)
            sudo apt install dkms bc
            echo "blacklist 8188eu" >> "/etc/modprobe.d/realtek.conf"
            echo "blacklist r8188eu" >> "/etc/modprobe.d/realtek.conf"
            sudo rmmod r8118eu.ko
            git clone https://github.com/aircrack-ng/rtl8188eus.git
            cd rtl8188eus
            sudo make
            sudo make install
            reboot
            ;;
        "Show Commands")
            echo "sudo apt-get update"
            echo "sudo apt-get install linux-image-$(uname -r)"
            echo "echo "blacklist 8188eu" >> "/etc/modprobe.d/realtek.conf""
            echo "echo "blacklist r8188eu" >> "/etc/nodprobe.d/realtek.conf""
            echo "sudo rmmod r8118eu.ko"
            echo "cd rtl8188eus"
            echo "sudo make"
            echo "sudo make install"
            echo "reboot"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
