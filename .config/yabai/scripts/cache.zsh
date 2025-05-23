#!/bin/zsh
# a set of functions for manipulating yabai cache

# Ensure cache directory exists
CACHE_DIR="$HOME/.cache/yabai"
CACHE="$CACHE_DIR/values.json"

# create an empty cache
function cache_init {
  mkdir -p "$CACHE_DIR"
  echo '{}' >$CACHE
}

# check if cache exists
# return 0 if yes else return 1
function validate_cache {
  [[ -f "$CACHE" ]] && jq -e . "$CACHE" >/dev/null 2>&1
}

# reads the current values from the cache
# variables available
#   cached_width
#   cached_height
#   YABAI_BSP_PADDING
#   YABAI_STACK_PADDING
# returns:
#   0 | 1
function read_cache {
  if [[ -f "$CACHE" ]]; then
    cached_width=$(jq -r '.cached_width' "$CACHE")
    cached_height=$(jq -r '.cached_height' "$CACHE")
    YABAI_BSP_PADDING=$(jq -r '.bsp_padding' "$CACHE")
    YABAI_STACK_PADDING=$(jq -r '.stack_padding' "$CACHE")
    return 0
  fi
  return 1
}

# update cache with new values
# params:
#   $1 - width
#   $2 - height
#   $3 - bsp
#   $4 - stack
# return: void
function write_cache {
  jq -n \
    --arg width "$1" \
    --arg height "$2" \
    --arg bsp "$3" \
    --arg stack "$4" \
    '{
      cached_width: $width,
      cached_height: $height,
      bsp_padding: $bsp,
      stack_padding: $stack
      }' >$CACHE || return 1
}
