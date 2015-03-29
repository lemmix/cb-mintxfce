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
echo "Install completed!" && sleep 3 
fi

sudo cp cb* /usr/local/bin/ && sudo chmod +x /usr/local/bin/cb*

if [ $? -ne 0 ]
then
echo "CP failed!" >&2
exit 1
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
else
echo "Now log out and make openbox your DE and login again to apply the changes" && sleep 3
fi

cb-exit && exit 0
