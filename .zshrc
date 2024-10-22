#zmodload zsh/zprof
export PATH=/usr/bin:/usr/local/bin:${PATH}
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"


# zsh
    # history
    HISTFILE=~/.zsh/.zsh_history
    setopt HIST_IGNORE_ALL_DUPS
    setopt SHARE_HISTORY
    setopt APPEND_HISTORY
    setopt HIST_EXPIRE_DUPS_FIRST
    setopt HIST_FIND_NO_DUPS
    setopt HIST_REDUCE_BLANKS
    SAVEHIST=5000
    HISTSIZE=2000

    # settings
    setopt AUTO_CD
    setopt NO_CASE_GLOB
    setopt NO_BEEP

    # autocomplete
    source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh


# node
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
alias node='unalias node ; unalias npm ; nvm use default --silent; node $@'
alias npm='unalias node ; unalias npm ; nvm use default --silent; npm $@'


# brew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


# bun
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH
[ -s "/Users/urbannovak/.bun/_bun" ] && source "/Users/urbannovak/.bun/_bun"

# Docker CLI
export PATH="$HOME/.docker/bin:$PATH"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init zsh)"

# eza
export EZA_CONFIG_DIR="$HOME/.config/eza"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)

# ngrok autocompletion
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

source ~/.config/alias.sh
#zprof
