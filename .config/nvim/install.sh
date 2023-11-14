set -xe

cfg=~/.config/nvim

rm -r $cfg
mkdir $cfg

cp ./init.lua ./lua $cfg -r

