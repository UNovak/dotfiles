# zsh
# shellcheck disable=SC2034
SHELL_SESSIONS_DISABLE=1
SKIP_GLOBAL_COMPINIT=1

# XDG config
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# file locations
export BIOME_CONFIG_DIR="$XDG_CONFIG_HOME/biome/biome.json"
export BUN_INSTALL="$HOME/.bun"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export GOKU_EDN_CONFIG_FILE="$XDG_CONFIG_HOME/karabiner/karabiner.edn"
export LESSHISTFILE="-"
export VOLTA_HOME="$HOME/.volta"

# homebrew options
export HOMEBREW_BUNDLE_FILE_GLOBAL="$XDG_CONFIG_HOME/homebrew/Brewfile"
export HOMEBREW_COLOR=1
export HOMEBREW_LOGS="/tmp/homebrew.logs"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
