# print path
alias path='echo -e ${PATH//:/\\n}'

# moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git
alias g="git"
alias ga="git add"
alias gap="git add -p"

alias gs="git status -s"
alias gc="git commit --verbose"

alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias ds="git diff --cached --output-indicator-new=' ' --output-indicator-old=' '"

alias gl="git log --color --decorate --abbrev-commit --date=human --pretty=format:'%C(yellow)%d%C(reset) %C(red)%h%C(reset) %C(white)%s%C(reset) %C(blue)<%an>%C(reset) %C(cyan)(%cr)%C(reset)'"

# eza
alias ezac='eza --no-filesize --ignore-glob="node_modules|.DS_Store|Icon'$'\r"'
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

# Expanding XDG_ env variables
cache() {
  print -r "${XDG_CACHE_HOME:-~/.cache}"
}

config() {
  print -r "${XDG_CONFIG_HOME:-~/.config}"
}
