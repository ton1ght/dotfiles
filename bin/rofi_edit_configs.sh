#!/bin/bash
#   __           ___     __   __ 
#  / /____  ___ <  /__ _/ /  / /_
# / __/ _ \/ _ \/ / _ `/ _ \/ __/
# \__/\___/_//_/_/\_, /_//_/\__/ 
#                /___/           
# https://github.com/ton1ght


declare options=("alacritty
picom
bspwm
sxhkd
dunst
i3
ranger
vim
polybar
rofi
xresources
zsh
quit")

choice=$(echo -e "${options[@]}" | rofi -dmenu  -i -p 'Edit config file')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
	;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	picom)
		choice="$HOME/.config/picom/picom.conf"
	;;
	rofi)
		choice="$HOME/.config/rofi/config.rasi"
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
