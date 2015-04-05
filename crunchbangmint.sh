#!/bin/bash

# this script will install the packages needed vor a crunchbanglike openbox DE. It is recommended to run sudo apt-get update first
# by markuslemmert@gmail.com

read -p "Installer: Do you really want to crunchbang your xfce?(y/n):" answer

case "$answer" in
        Yes|yes|Y|y|"") echo "Ok..."
            sudo apt-get install -y openbox obconf obmenu tint2 xcompmgr nitrogen hsetroot volti gksu;;
        No|no|N|n) echo "Aborted."
            exit 1
            ;;
            *) echo "Unknown parameter" 
            ;;
esac

if [ $? -ne 0 ]
then
	echo "Something went wrong! One or more packages...[Failed]" >&2
exit 1
else 
	echo "Packages installed...[OK]" && sleep 3 
fi

sudo cp cb* /usr/local/bin/ && sudo chmod +x /usr/local/bin/cb*

if [ $? -ne 0 ]
then
	echo "CP failed!" >&2
	sleep 3 && exit 1
else 
	echo "Pipemenus copied...[OK]" && sleep 3 
fi


read -p "Make folder ~/.config/openbox/ and copy files into it?(y/n):" answer

case "$answer" in
        Yes|yes|Y|y|"") echo "Ok..."
            sudo mkdir ~/.config/openbox/ && sudo cp menu.xml rc.xml autostart ~/.config/openbox/;;
        No|no|N|n) echo "Standard files will be used!"
            ;;
            *) echo "Unknown parameter! Standard files will be used ..." 
            ;;
esac


if [ $? -ne 0 ]
then
	echo "CP failed!" >&2
fi

sleep 3

read -p "Finished...! Do you want to log out now?(y/n):" answer

case "$answer" in
        Yes|yes|Y|y|"") echo "Ok..."
            openbox --exit;;
        No|no|N|n) echo "Well you can use xfce, no problem..."
            exit 0
            ;;
            *) echo "Unknown parameter" 
            ;;
esac

exit 0
