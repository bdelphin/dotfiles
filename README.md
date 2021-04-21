# BDELPHIN's desktop env. dotfiles repo

**/!\ OLD STUFF, NOT UPDATED ANYMORE.
My current dotfiles are here : https://github.com/bdelphin/dotfiles_v2**

This repository is the home for my DotFiles (config files, starting with a dot ".") for my Arch Linux "Desktop Environment". 

But wait, there's more ! It comes with an auto install/ricing script !

Since I'm lazy, I don't like spending hours on setting up/tweaking my environment on every machine I'm using. Same thing with Arch Linux, even if I like setting up my Arch environment, it's a time-consuming task. 

So I decided to automate the process with a nice script that will at least copy my dotfiles in place. The cool thing is that I can run it on a fresh Arch install, as it will install automaticaly any packet needed !

I'm using i3-gaps Window Manager, Polybar, rofi&dmenu, URxvt, compton and Pywal. For now, not every config files has been uploaded, as I need to clean them up. You can see what have been uploaded in the section below.

Here's the result :
![screenshot](screenshot.png?raw=true "Screenshot")

I will update this repo slowly, I'm currently quite busy.

## added:
- i3-gaps vindow manager config file. see in i3-gaps folder.
- polybar config
- dunst setup
- pywal colorscheme
- system scripts (.Xresources, .xinitrc, .bashrc, .bash_profile)
- install script

## WARNING
- BROKEN FOR NOW : update / rollback / restore scripts.

## coming soon:
- more config files

## Install / How to use

Please read this entirely before running any command.
Keep in mind that running unknown scripts can be harmfull for your system.

Just clone the repo and run the install script :
```bash
git clone https://github.com/bdelphin/dotfiles
cd dotfiles
./install.sh
```
This install script will explain what it's doing at every step, and will ask for confirmation.
Existing config files will be backed up before copying the new ones in place and restart i3.

This install script is designed ONLY for Arch Linux based systems, using pacman for packet management.
If you intend to use it, lets say, on a Debian system, you should replace all pacman related stuff with apt-get commands. 
Maybe I'll make it work for Debian based systems some day.

## Daily use / Tweak it ! / Update script

### EVERYTHING BELOW IS BROKEN RIGHT NOW.

You can directly edit dotfiles in their respective locations if you don't intend to use my scripts anymore.

That being said, for editing config files and tweaking your system, I recommend that you edit files directly in the repo dotfiles directory. This will allow you to continue using my scripts for updating your config files, and deploying them on other machines.

Once you're done editing, you can test your modifications by launching:
```bash
./update.sh
```
! WARNING ! This script doesn't work like the install script. Nothing will be explained and it won't ask for confirmation. It will just create a .bak-update file of the previous config files, without the timestamp. This implies that everytime you lauch it, your previous .bak-update is replaced with the new one.
This allow to rollback to your previous config:
```bash
./rollback.sh
```
The update script is intended to test minor modifications faster, and rollback fast as well if needed. If you're making huge changes in multiple files, it may be more appropriate to re-use install script for full backup.

Last but not least, if you wish, you can restore any backed-up config file created with the install script by running:
```bash
./restore.sh
```
This script will open a menu where you'll have to choose which config to restore. Only working with i3 config file for now.

## Licence 
Under GNU GPLv3 Licence, see LICENCE file.
