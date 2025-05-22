#!/bin/zsh
# a set of functions for manipulating yabai cache
file="$YABAI_CACHE_DIR/values.cache.json"

# create an empty cache
function cache_init {
  mkdir -p "$YABAI_CACHE_DIR"
  echo '{}' >$file
}

# check if cache exists
# return 0 if yes else return 1
function validate_cache {
  [[ -f "$file" ]] && jq -e . "$file" >/dev/null 2>&1
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
  if [[ -f "$file" ]]; then
    cached_width=$(jq -r '.cached_width' "$file")
    cached_height=$(jq -r '.cached_height' "$file")
    YABAI_BSP_PADDING=$(jq -r '.bsp_padding' "$file")
    YABAI_STACK_PADDING=$(jq -r '.stack_padding' "$file")
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
      }' >$file || return 1
}
