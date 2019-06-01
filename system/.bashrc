#
# ~/.bashrc
#


# pywal thingy
(cat ~/.cache/wal/sequences &)
#cat ~/.cache/wal/sequences



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias neo='clear;neofetch;echo -e "There'"'"'s no place like 127.0.0.1.\n"'

PS1='[\u@\h \W]\$ '
