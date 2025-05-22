#!/bin/zsh

source ~/.config/yabai/scripts/cache.zsh

# get current display dimensions from yabai
# returns:
# display_width
# display_height
function get_display_size {
  local display=$(yabai -m query --displays --display)
  display_width=$(jq -r '.frame.w | floor' <<<"$display")
  display_height=$(jq -r '.frame.h | floor' <<<"$display")
}

# decide what padding to use based on display size
function calculate_padding {
  if ((display_width >= 2560 && display_height >= 1440)); then
    YABAI_BSP_PADDING=32
    YABAI_STACK_PADDING=48
  else
    YABAI_BSP_PADDING=16
    YABAI_STACK_PADDING=24
  fi
}

# return true (0) if dimensions changed
function dimensions_changed {
  ((cached_width != display_width || cached_height != display_height))
}

# chack current display size and compare it with cache
# recalclate the cache when needed
# return:
#   0 - updated the cache
#   4 - there was no need to update
#   1 - unknown error
function update_yabai {
  get_display_size
  if validate_cache && read_cache; then
    if ! dimensions_changed; then
      return 4 # nothing to do
    else
      calculate_padding
      write_cache $display_width $display_height $YABAI_BSP_PADDING $YABAI_STACK_PADDING
    fi
  else
    #c
    cache_init
    get_display_size
    calculate_padding
    write_cache $display_width $display_height $YABAI_BSP_PADDING $YABAI_STACK_PADDING
  fi
  export YABAI_BSP_PADDING
  export YABAI_STACK_PADDING
  return 0
}
