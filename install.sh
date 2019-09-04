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
printf "USE AT YOUR OWN RISK ! This script will backup everything, but it has only \nbeen tested on few machines. Sudo is needed and will prompt for password.\n\n"

read -p "Are you sure you want to continue (Y/n) ? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Exiting."
    exit
fi

# prerequisites ###############################################################
printf "═══ Prerequisites ═══════════════════════════════════════════════════════\n"
# update pacman
echo "Let's update pacman database first."
sudo pacman -Sy --noconfirm --logfile ./pacman_update.log
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

# install prerequisites #######################################################
if [ "$packagelist" = "" ]; then
	echo -e "Prerequisites install: \e[38;5;82mOK. \e[0m(nothing to install)"
else
	sudo pacman -S --noconfirm $packagelist
	if [ $? -eq 0 ]; then
		echo -e "Prerequisites install: \e[38;5;82mOK.\e[0m"
	else
		echo -e "Prerequisites install: \e[38;5;196mFAIL.\e[0m"
	fi
fi
printf "\n\n"
sleep 1

# Backup ######################################################################
printf "═══ Backup ══════════════════════════════════════════════════════════════\n"
# backup existing config files ################################################
mkdir -p ./backups
mkdir -p ./backups/i3-gaps
mkdir -p ./backups/polybar
mkdir -p ./backups/system
mkdir -p ./backups/dunst

# i3-gaps :
if [ ! -f $HOME/.config/i3/config ]; then
	echo "No i3 config to backup. Skipping."
else
	cp $HOME/.config/i3/config ./backups/i3-gaps/config.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e "i3-gaps config backup: \e[38;5;82mOK.\e[0m"
	else
		echo -e "i3-gaps config backup: \e[38;5;196mFAIL.\e[0m"
	fi	
fi

# polybar : 
if [ ! -f $HOME/.config/polybar/config ]; then
	echo "No polybar config to backup. Skipping."
else
	cp $HOME/.config/polybar/config ./backups/polybar/config.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e "polybar config backup: \e[38;5;82mOK.\e[0m"
	else
		echo -e "polybar config backup: \e[38;5;196mFAIL.\e[0m"
	fi
fi

# Xresources
if [ ! -f $HOME/.Xresources ]; then
	echo "No .Xresources file to backup. Skipping."
else
	cp $HOME/.Xresources ./backups/system/.Xresources.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e ".Xresources file backup: \e[38;5;82mOK.\e[0m"
	else
		echo -e ".Xresources file backup: \e[38;5;196mFAIL.\e[0m"
	fi
fi

# xinitrc
if [ ! -f $HOME/.xinitrc ]; then
	echo "No .xinitrc file to backup. Skipping."
else
	cp $HOME/.xinitrc ./backups/system/.xinitrc.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e ".xinitrc config backup: \e[38;5;82mOK.\e[0m"
	else
		echo -e ".xinitrc config backup: \e[38;5;196mFAIL.\e[0m"
	fi
fi

# bashrc
if [ ! -f $HOME/.bashrc ]; then
	echo "No .bashrc file to backup. Skipping."
else
	cp $HOME/.bashrc ./backups/system/.bashrc.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e ".bashrc file backup: \e[38;5;82mOK.\e[0m"
	else	
		echo -e ".bashrc file backup: \e[38;5;196mFAIL.\e[0m"
	fi
fi

# bash_profile
if [ ! -f $HOME/.bash_profile ]; then
	echo "No .bash_profile file to backup. Skipping."
else
	cp $HOME/.bash_profile ./backups/system/.bash_profile.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e ".bash_profile file backup: \e[38;5;82mOK.\e[0m"
	else	
		echo -e ".bash_profile file backup: \e[38;5;196mFAIL.\e[0m"
	fi
fi

# dunst
if [ ! -f $HOME/.config/dunst/dunstrc ]; then
	echo "No dunst config to backup. Skipping."
else
	cp $HOME/.config/dunst/dunstrc ./backups/dunst/dunstrc.bak-$(date -Iseconds)
	if [ $? -eq 0 ]; then
		echo -e "Dunst config backup: \e[38;5;82mOK. \e[0m"
	else
		echo -e "Dunst config backup: \e[38;5;196mFAIL. \e[0m"
	fi
fi	
printf "\n\n"
sleep 1

# copying new config ##########################################################
printf "═══ Copying new config files ════════════════════════════════════════════\n"
cp ./i3-gaps/config $HOME/.config/i3/config
if [ $? -eq 0 ]; then
	echo -e "i3-gaps config update: \e[38;5;82mOK.\e[0m"
else
	echo -e "i3-gaps config update: \e[38;5;196mFAIL.\e[0m"
fi
cp -R ./polybar/* $HOME/.config/polybar/
if [ $? -eq 0 ]; then
	echo -e "polybar config update: \e[38;5;82mOK.\e[0m"
else
	echo -e "polybar config update: \e[38;5;196mFAIL.\e[0m"
fi
cp ./system/.Xresources $HOME/
if [ $? -eq 0 ]; then
	echo -e ".Xresources config update: \e[38;5;82mOK.\e[0m"
else
	echo -e ".Xresources config update: \e[38;5;196mFAIL.\e[0m"
fi
cp ./system/.xinitrc $HOME/
if [ $? -eq 0 ]; then
	echo -e ".xinitrc config update: \e[38;5;82mOK.\e[0m"
else
	echo -e ".xinitrc config update: \e[38;5;196mFAIL.\e[0m"
fi
cp ./system/.bashrc $HOME/
if [ $? -eq 0 ]; then
	echo -e ".bashrc config update: \e[38;5;82mOK.\e[0m"
else
	echo -e ".bashrc config update: \e[38;5;196mFAIL.\e[0m"
fi
cp ./system/.bash_profile $HOME/
if [ $? -eq 0 ]; then
	echo -e ".bash_profile config update: \e[38;5;82mOK.\e[0m"
else
	echo -e ".bash_profile config update: \e[38;5;196mFAIL.\e[0m"
fi
mkdir -p $HOME/.config/dunst
cp -R ./dunst/* $HOME/.config/dunst/
if [ $? -eq 0 ]; then
	echo -e "dunst config update: \e[38;5;82mOK.\e[0m"
else
	echo -e "dunst config update: \e[38;5;196mFAIL.\e[0m"
fi

printf "\n\n"
sleep 1



# asking user if he's in X11 or not
echo "Are you in X11 right now ? [Y|n]"
read -n 1 x_11
if [[ $x_11 == "n" ]];then
	# he's not, ask him if he wants to be
	printf "\n\n"
	echo "This script can't generate colorscheme and wallpaper if X11 is not running."
	echo "When X11 will be started, relaunch this script to finish setting things up."
	printf "\n"
	echo "Would you like to startx right now ? [Y|n]"
	read -n 1 start_x
	if [[ $start_x == "n" ]];then
		printf "\n\n"
		echo "X11 won't be launched."
		echo "If you want to start one, just run startx."
		printf "\n"
		printf "(Almost) everything has been set up.\nThanks for using BDELPHIN's auto-rice script."
		exit
	else
		echo "X11 will start in 5 seconds."
		secs=5
		while [ $secs -gt 0 ]; do
			echo -ne "$secs\033[O\r"
			sleep 1
			: $((secs--))
		done	
		startx 2>&1 $HOME/.startx.log
		exit
	fi	
fi

# setting up wallpaper & colorscheme ##########################################
printf "\n═══ Wallpaper & Colorscheme ═════════════════════════════════════════════\n"
betterlockscreen -u ./Wallpapers/wallhaven-n6lqow.jpg 2>&1 $HOME/.betterlockscreen.log
if [ $? -eq 0 ]; then
	echo -e "Betterlockscreen setup: \e[38;5;82mOK.\e[0m"
else
	echo -e "Betterlockscreen setup: \e[38;5;196mFAIL.\e[0m"
fi



# TODO : ask user which transparency level he wants

echo "Which transparency level do you want ?"
transparency_level=110
while [ "$transparency_level" -gt 100 -o "$transparency_level" -lt 1 ]
do
	echo "Input a number between 0 & 100, 100 being fully opaque."
	read -r transparency_level
done

wal -i ./Wallpapers/wallhaven-p872we.jpg -a $transparency_level > ./pywal.log
if [ $? -eq 0 ]; then
	echo -e "Pywal setup: \e[38;5;82mOK.\e[0m"
	$HOME/.config/dunst/wal_dunst.sh 2>&1 > /dev/null
	if [ $? -eq 0 ]; then
		echo -e "Dunst colorscheme setup: \e[38;5;82mOK.\e[0m"
	else
		echo -e "Dunst colorscheme setup: \e[38;5;196mFAIL.\e[0m"
	fi
else
	echo -e "Pywal setup: \e[38;5;196mFAIL.\e[0m"
	echo -e "Dunst colorscheme setup: Skipping."
fi

# restart i3 ##################################################################
echo "i3-gaps will restart in 5 seconds."
secs=5
while [ $secs -gt 0 ]; do
	echo -ne "$secs\033[O\r"
	sleep 1
	: $((secs--))
done
i3-msg restart	
printf "\n\n"
notify-send "Welcome on board !" "Auto-ricing script is complete." -u normal
printf "\n"
echo "Everything has been set up. Thanks for using BDELPHIN's auto-rice script."


