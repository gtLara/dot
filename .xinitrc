#!/bin/sh

zsh &
gpc &
unclutter --timeout 3 &
dunst &
sxhkd &
redshift &
xcompmgr &
. ~/.xprofile
~/.suckless/dwm-bar/dwm_bar.sh &
xwallpaper --zoom media/pictures/monos-0.png &
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
exec dwm
