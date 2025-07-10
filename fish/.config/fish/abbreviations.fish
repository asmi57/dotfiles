
abbr --add refish source $FISH_DIRECTORY/config.fish

alias eza="eza --sort type --icons --git --git-ignore"
abbr --add l  eza -l
abbr --add la eza -la
abbr --add ls eza

abbr --add c   "z"
abbr --add ci  "zi"
abbr --add cl  "clear; eza -l"
abbr --add cla "clear; eza -la"

abbr --add rd rmdir

abbr --add fetch fastfetch
abbr --add nmt 'bash -c "unset COLORTERM; TERM=xterm-old nmtui"'


abbr --add vim nvim
abbr --add nv  nvim
abbr --add v   nvim

abbr --add bt   bluetuith
abbr --add spot ncspot
abbr --add pm   pulsemixer

abbr --add g     git
abbr --add gs    git status
abbr --add ga    git add
abbr --add gaa   git add --all
abbr --add gc    git commit -v
abbr --add gco   git checkout
abbr --add gr    git remote -v
abbr --add gb    git branch
abbr --add grs   git restore
abbr --add grst  git restore --staged
abbr --add gst   git stash
abbr --add gc    git commit
abbr --add gd    git diff
abbr --add gdc   git diff --cached
abbr --add glo   git log
abbr --add glog  git log --graph --oneline --decorate
abbr --add gloga git log --graph --oneline --decorate --all

alias swaynodes="swaymsg -t get_tree | jq 'def ret(node): [node, ((node.floating_nodes + node.nodes)[] | ret(.))[]]; ret(.)'"

