#!/bin/sh

clear

# bdelphin auto-ricing / env. setup script
# USE AT YOUR OWN RISK (even if everything is backed up)

printf "═════════════════════════════════════════════════════════════════════════\n\n"

echo "██████╗ ██████╗ ███████╗██╗     ██████╗ ██╗  ██╗██╗███╗   ██╗"
echo "██╔══██╗██╔══██╗██╔════╝██║     ██╔══██╗██║  ██║██║████╗  ██║   ██╗"
echo "██████╔╝██║  ██║█████╗  ██║     ██████╔╝███████║██║██╔██╗ ██║  ██╝  ████╗"
echo "██╔══██╗██║  ██║██╔══╝  ██║     ██╔═══╝ ██╔══██║██║██║╚██╗██║       █╔══╝"
echo "██████╔╝██████╔╝███████╗███████╗██║     ██║  ██║██║██║ ╚████║       ████╗"
echo "╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝       ╚══█║"
echo "             _              _                          _       _    ████║"
echo "  __ _ _   _| |_ ___   _ __(_) ___ ___   ___  ___ _ __(_)_ __ | |_  ╚═══╝"
echo " / _\` | | | | __/ _ \\ | '__| |/ __/ _ \\ / __|/ __| '__| | '_ \\| __|"
echo "| (_| | |_| | || (_) || |  | | (_|  __/ \\__ \\ (__| |  | | |_) | |_ "
echo " \\__,_|\\__,_|\\__\\___/ |_|  |_|\\___\\___| |___/\\___|_|  |_| .__/ \\__|"
echo "                                                        |_| "

printf "═════════════════════════════════════════════════════════════════════════\n\n"

printf "Welcome to my auto-rice / desktop env. setup script !\n"
printf "It's inspired by LARBS (Luke Auto Rice Bootstraping Script).\n\n"
printf "USE AT YOUR OWN RISK ! This script will backup everything, but it has only \nbeen tested on few machines.\n\n"


read -p "Are you sure you want to continue (Y/n) ? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Exiting."
    exit
fi


# scan prerequisites.txt for packages needed
packagelist=""
while read package; do
	#echo "$package"
	if [ $package = "$(pacman -Qqe | grep $package)" ]
	then
		echo "$package is already installed. Skipping."
	else
		echo "$package not installed, added to install list."
		packagelist="${packagelist}$package "
	fi
done <./prerequisites.txt

# install prerequisites
echo "pacman -S $packagelist"


# backup existing config files
# i3-gaps :
cp $HOME/.config/i3/config $HOME/.config/i3/config.bak-$(date -Iseconds)
echo "i3-gaps config backup: OK."

# copying new config
cp ./i3-gaps/config $HOME/.config/i3/config
echo "i3-gaps config update: OK."

# reloading things
#i3-msg restart
echo "i3-gaps restart: OK."

