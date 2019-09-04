#
# ~/.bashrc
#


# pywal thingy
(cat ~/.cache/wal/sequences &)
#cat ~/.cache/wal/sequences


# import pywal colors
. "${HOME}/.cache/wal/colors.sh"
alias dmen='dmenu_run -nb "$color0" -nf "$color7" -sb "$color2" -sf "$color7"'

export bgpolybar_alpha="#BB${color0/'#'}"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias neo='clear;neofetch;echo -e "There'"'"'s no place like 127.0.0.1.\n"'



PS1='[\u@\h \W]\$ '
