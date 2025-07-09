set -gx FISH_DIRECTORY "$HOME/.config/fish"
set -U fish_greeting ""

if [ ! -e /tmp/theme ]
	touch /tmp/theme
end
# echo -n mocha > /tmp/theme
echo -n gruv > /tmp/theme



if status is-interactive
	source $FISH_DIRECTORY/abbreviations.fish
	zoxide init fish | source
	if tty | grep tty
		set istty
	end
	if set -q istty
	else
		if set -q NO_STARSHIP
		else
			starship init fish | source
		end
	end
end

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME   $HOME/.local/share
set -gx XDG_CACHE_HOME  $HOME/.local/cache
set -gx XDG_STATE_HOME  $HOME/.local/state

set -gx EDITOR nvim
set -gx BACKLIGHT /sys/class/backlight/amdgpu_bl1
set -gx WALLPAPER_DIR $HOME/media/wallpapers

set -gx CEDEV /opt/CEdev
set -gx GOPATH                $XDG_DATA_HOME/go
set -gx CARGO_HOME            $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME           $XDG_DATA_HOME/rustup
set -gx GRADLE_USER_HOME      $XDG_DATA_HOME/gradle
set -gx GNUPGHOME             $XDG_DATA_HOME/gnupg
set -gx PYTHON_HISTORY        $XDG_STATE_HOME/python/history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx GHCUP_USE_XDG_DIRS true

set -e PATH
set -gx PATH $PATH /usr/bin
set -gx PATH $PATH /usr/bin/site_perl
set -gx PATH $PATH /usr/bin/vendor_perl
set -gx PATH $PATH /usr/bin/core_perl
set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/sbin
set -gx PATH $PATH /usr/lib/rustup/bin
set -gx PATH $PATH $XDG_DATA_HOME/bin
set -gx PATH $PATH $XDG_DATA_HOME/ghcup/bin
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $XDG_DATA_HOME/nvim/mason/bin
set -gx PATH $PATH $HOME/.scripts
set -gx PATH $PATH $HOME/.android/sdk/platform-tools
set -gx PATH $PATH $CEDEV/bin
set -gx PATH $PATH $CARGO_HOME/bin
set -gx PATH $PATH $HOME/dev/suckless/bin
set -gx PATH $PATH $XDG_CONFIG_HOME/eww/scripts

set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx XAUTHORITY $XDG_CONFIG_HOME/X11/Xauthority

set -gx QT_AUTO_SCREEN_SET_FACTOR 1
set -gx QT_SCALE_FACTOR 1
# set -gx QT_FONT_DPI 96

if test -e /tmp/startupflag
	sudo rm /tmp/startupflag
	test $DISPLAY || sway
end

set -gx http_proxy 		# http://73.253.211.53:8888/
set -gx https_proxy 	$http_proxy
set -gx ftp_proxy 		$http_proxy
set -gx rsync_proxy 	$http_proxy
set -gx no_proxy 		"localhost,127.0.0.1,localaddress,.localdomain.com"
