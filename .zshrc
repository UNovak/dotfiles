#zmodload zsh/zprof


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

# path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Applications/MEGAcmd.app/Contents/MacOS:$PATH"


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


# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)

# volta
source <(volta completions zsh)

fi

# syntax higlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/alias.sh
#zprof
