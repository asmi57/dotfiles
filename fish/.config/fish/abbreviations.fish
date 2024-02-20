
abbr --add refish source $FISH_DIRECTORY/config.fish

alias eza="eza --sort type --icons --git --git-ignore"
abbr --add l  eza -l
abbr --add la eza -la
abbr --add ls eza

abbr --add cl  "clear; eza -l"
abbr --add cla "clear; eza -la"

abbr --add rd rmdir

abbr --add fetch fastfetch

abbr --add pmixer pulsemixer
abbr --add pmx    pulsemixer

abbr --add vim nvim
abbr --add nv  nvim
abbr --add v   nvim

abbr --add blutui bluetuith
abbr --add bt     bluetuith

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
