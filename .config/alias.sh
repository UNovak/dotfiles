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
alias ezac="eza --ignore-glob='Icon'$'\r'"
alias ls="ezac"
alias lf="ezac --only-files"
alias ld="ezac --only-dirs"

# long
alias 'ls -l'="ezac --long --accessed --smart-group"
alias 'lf -l'="ezac --long --only-files --accessed --smart-group"
alias 'ld -l'="ezac --long --only-dirs --accessed --smart-group"

# util shortcuts
alias top="htop"
alias net="speedtest-cli"
alias c="clear"

# managing config files
alias conf="/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
