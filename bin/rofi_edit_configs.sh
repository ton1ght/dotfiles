#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for editing some of my more frequently edited config files.


declare options=("alacritty
picom
dunst
i3
ranger
vim
polybar
xresources
zsh
quit")

choice=$(echo -e "${options[@]}" | rofi -dmenu  -i -p 'Edit config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
	;;
	picom)
		choice="$HOME/.config/picom/picom.conf"
	;;
	dunst)
		choice="$HOME/.config/dunst/dunstrc"
	;;
	i3)
		choice="$HOME/.config/i3/config"
	;;
	ranger)
		choice="$HOME/.config/ranger/rc.conf"
	;;
	vim)
		choice="$HOME/.config/nvim/.vimrc"
	;;
	polybar)
		choice="$HOME/.config/polybar/config"
	;;
	xresources)
		choice="$HOME/.Xresources"
	;;
	zsh)
		choice="$HOME/.zshrc"
	;;
	*)
		exit 1
	;;
esac

alacritty -e nvim "$choice"
