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


# brew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH


# bun
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH

# completion
autoload -Uz compinit
[ ! "$(find ~/.zcompdump -mtime 1)" ] || compinit
compinit -C

fpath=(
  "$HOME/.zsh/completions"
  "/opt/homebrew/share/zsh-completions"
  $fpath
)

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

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
source <(volta completions zsh)

# ngrok autocompletion
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# syntax higlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/alias.sh
#zprof
