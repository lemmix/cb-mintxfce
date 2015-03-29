#!/bin/bash

# this script will install the packages needed vor a crunchbanglike openbox DE. It is recommended to run sudo apt-get update first
# by markuslemmert@gmail.com

DIALOG=${DIALOG=dialog}

$DIALOG --title " crunchbang the Mint Xfce" --clear \
        --yesno "Do you really want to crunchbang your Xfce?" 10 30

case $? in
  0)
    clear && sudo apt-get install -y openbox obconf obmenu tint2 xcompmgr nitrogen hsetroot;;
  1)
    clear && exit 1;;
  255)
    clear && exit 1;;
esac

if [ $? -ne 0 ]
then
echo "Install failed!" >&2
exit 1
else 
echo "Packages installed!" && sleep 3 
fi

sudo cp cb* /usr/local/bin/ && sudo chmod +x /usr/local/bin/cb*

if [ $? -ne 0 ]
then
echo "CP failed!" >&2
sleep 3 && exit 1
else 
echo "Pipemenus copied!" && sleep 3 
fi


$DIALOG --title " crunchbang the Mint Xfce" --clear \
        --yesno "Make Folder ~/.config/openbox/ and cp Files into it? " 10 30

case $? in
  0)
    clear && sudo mkdir ~/.config/openbox/ && sudo cp menu.xml rc.xml autostart ~/.config/openbox/;;
  1)
    clear && echo "Standard files will be used!";;
  255)
    clear && echo "Standard files will be used!";;
esac

if [ $? -ne 0 ]
then
echo "CP failed!" >&2
exit 1
fi

sleep 3

$DIALOG --title "Finished" --msgbox 'Now you crunchbanged your Xfce - Log out and choose openbox as DE' 10 30
clear
cb-exit && exit 0
