#!/bin/env sh

modules="betterdiscord fish kitty nvim picom rofi scripts starship tmux x11 sway"

for module in $modules; do
	stow -t $HOME $module
done

