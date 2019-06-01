#!/bin/sh

# bdelphin auto-ricing / env. rollback script
# USE AT YOUR OWN RISK

# restoring backup
cp $HOME/.config/i3/config.bak-update $HOME/.config/i3/config

# reloading things
i3-msg restart

