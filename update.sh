#!/bin/sh

# bdelphin auto-ricing / env. update script
# USE AT YOUR OWN RISK (even if everything is backed up)

# backup existing config files
# i3-gaps :
cp $HOME/.config/i3/config $HOME/.config/i3/config.bak-update

# copying new config
cp ./i3-gaps/config $HOME/.config/i3/config

# reloading things
i3-msg restart

