#zmodload zsh/zprof

# path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Applications/MEGAcmd.app/Contents/MacOS:$PATH"

# zsh history
HISTFILE="$XDG_CACHE_HOME/zsh/zsh.hist"
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# shell options
setopt CSH_NULL_GLOB
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt NO_CORRECT
unsetopt AUTO_CD

# completion
autoload -Uz compinit
[ ! "$(find ~/.zcompdump -mtime 1)" ] || compinit
compinit -C

fpath=(
  "$HOME/.zsh/completions"
  "/opt/homebrew/share/zsh-completions"
  $fpath
)

# tools
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -s "/Users/urbannovak/.bun/_bun" ] && source "/Users/urbannovak/.bun/_bun"

# tool completions (safe-loaded)
if command -v ngrok &>/dev/null; then eval "$(ngrok completion 2>/dev/null)"; fi
if command -v volta &>/dev/null; then source <(volta completions zsh 2>/dev/null); fi
if command -v fzf &>/dev/null; then source <(fzf --zsh 2>/dev/null); fi

# starship
if command -v starship &>/dev/null; then
  export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
  export STARSHIP_CACHE="$XDG_CACHE_HOME/starship/cache"
  eval "$(starship init zsh)"
fi

# syntax higlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/alias.sh
#zprof
