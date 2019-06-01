#!/bin/sh

# bdelphin auto-ricing / env. rollback script
# USE AT YOUR OWN RISK

conf=$(ls $HOME/.config/i3/config.bak-* | dmenu -l 30)

# restoring backup
cp $conf $HOME/.config/i3/config

# reloading things
i3-msg restart

