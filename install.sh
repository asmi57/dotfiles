#!/bin/env sh

modules=$(fd --exact-depth 1 --type directory)

for module in $modules; do
	stow -t $HOME $module
done

