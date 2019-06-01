#/bin/bash

. "${HOME}/.cache/wal/colors.sh"

pkill -f dunst
dunst \
	-frame_width 3 \
	-li "${HOME}/.config/dunst/tux.png" \
	-ni "${HOME}/.config/dunst/tux.png" \
	-ci "${HOME}/.config/dunst/tux.png" \
	-lfr "${color2}" \
	-nfr "${color2}" \
	-lb "${color0}" \
	-nb "${color0}" \
	-cb "${color0}" \
	-lf "${color7}" \
	-cf "${color7}" \
	-nf "${color7}" &






