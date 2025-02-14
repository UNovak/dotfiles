# print path
alias path='echo -e ${PATH//:/\\n}'

# moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git
alias gs="git status"
alias glg="git lg"

# eza
alias ezac='eza --no-filesize --no-symlinks --ignore-glob=".DS_Store|Icon'$'\r"'
alias ls="ezac -F --time-style='+%Y-%m-%d %H:%M' --time=modified --smart-group --group-directories-last -b"
alias lf="ezac --only-files"
alias ld="ezac --only-dirs"
alias lg="ezac --long --no-filesize --git-repos --git"

# eza long
alias 'ls -l'="ezac --no-filesize --long --no-git"
alias 'lf -l'="ezac --long --only-files --git-repos-no-status"
alias 'ld -l'="ezac --long --only-dirs --time-style='+%Y-%m-%d %H:%M' --time=modified --smart-group --git-repos-no-status"

# util shortcuts
alias net="speedtest-cli"
alias c="clear"

# managing config files
alias conf="/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
