#!/bin/env sh

modules="betterdiscord btop fish kitty nvim picom rofi scripts starship tmux x11 sway"

for module in $modules; do
	stow -t $HOME $module
done

