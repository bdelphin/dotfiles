#!/bin/sh

case "$1" in
  --toggle)
        if [ $(cat /sys/class/leds/smc\:\:kbd_backlight/brightness) -eq 0 ]; then
            echo "100" | tee /sys/class/leds/smc\:\:kbd_backlight/brightness > /dev/null
        else
            echo "0" | tee /sys/class/leds/smc\:\:kbd_backlight/brightness > /dev/null
	fi
        ;;
    *)
	while [ 1 ]
	do
            if [ $(cat /sys/class/leds/smc\:\:kbd_backlight/brightness) -eq 0 ]; then
              echo " %{F#c7bcb9} %{F-} "
            else
            	echo " %{F#27a8e7} %{F-} "
            fi
	    sleep 0.1
	done
        ;;
esac
