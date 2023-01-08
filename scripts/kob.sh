#!/usr/bin/bash

cat  <<  EOF 

 _   _____________ 
| | / /  _  | ___ \
| |/ /| | | | |_/ /
|    \| | | | ___ \
| |\  \ \_/ / |_/ /
\_| \_/\___/\____/ 
                   
EOF
echo "RUN KALI ON BROWSER..."

#Checking For Root Access
echo "Checking For Root User...."
sleep 2
if [[ $(id -u) -ne 0 ]] ; then 
   echo "You are Not Root! Please Run as root" ; exit 1 ; 
else echo "Checking For Requirement Packages.." ; 
fi

echo "UPDATING KALI LINUX..."
sudo apt update
clear
echo "INSTALLING NOVNC X11VNC..."
sudo apt install -y novnc x11vnc
clear
echo "CONFIGURE X11VNC..."
sleep 5
x11vnc -display :0 -autoport -localhost -nopw -bg -xkb -ncache -ncache_cr -quiet -forever
ss -antp | grep vnc
clear
/usr/share/novnc/utils/launch.sh --listen 8081 --vnc localhost:5900
echo "ENABLE SSH.."
sleep 5
sudo systemctl enable ssh --now
