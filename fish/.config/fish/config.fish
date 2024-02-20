set -gx FISH_DIRECTORY "$HOME/.config/fish"
set -U fish_greeting ""

if status is-interactive
	source $FISH_DIRECTORY/abbreviations.fish
	starship init fish | source
	thefuck --alias    | source
end


set -gx EDITOR nvim
set -gx BACKLIGHT /sys/class/backlight/gmux_backlight
set -gx WALLPAPER_DIR $HOME/media/wallpapers

set -gx CEDEV /opt/CEdev
set -gx GOPATH                $XDG_DATA_HOME/go
set -gx CARGO_HOME            $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME           $XDG_DATA_HOME/rustup
set -gx GRADLE_USER_HOME      $XDG_DATA_HOME/gradle
set -gx GNUPGHOME             $XDG_DATA_HOME/gnupg
set -gx PYTHON_HISTORY        $XDG_STATE_HOME/python/history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx JAVAPATH              $XDG_CONFIG_HOME/java
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot=$JAVAPATH
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
set -gx PATH $PATH $HOME/.scripts
set -gx PATH $PATH $HOME/.android/sdk/platform-tools
set -gx PATH $PATH $CEDEV/bin
set -gx PATH $PATH $CARGO_HOME/bin

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME   $HOME/.local/share
set -gx XDG_CACHE_HOME  $HOME/.local/cache
set -gx XDG_STATE_HOME  $HOME/.local/state

set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx XAUTHORITY $XDG_CONFIG_HOME/X11/Xauthority
