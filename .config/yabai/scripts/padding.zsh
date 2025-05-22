#!/bin/zsh
# this script runs whenever a display is resized or when mac wakes from sleep
# display size is cached in $YABAI_CACHE_DIR/values.cache.json

# set padding for normal spaces
function set_global_padding {
  local padding=$1
  yabai -m config top_padding $padding \
                  bottom_padding $padding \
                  left_padding $padding \
                  right_padding $padding \
                  window_gap $(( $padding / 4 ))
}

# apply padding for stack layout
function handle_stack {
  local index=$1
  local padding=$2
  yabai -m config --space $index top_padding $padding \
                                 right_padding $padding \
                                 bottom_padding $padding \
                                 left_padding $padding \
                                 window_gap $(( $padding / 4 ))
}

# call handle stack for all spaces with stack layout
function set_stacks_padding {
  if [[ ${#stacked_spaces[@]} -ne 0 ]]; then
    for index in ${stacked_spaces[@]}; do
      handle_stack $index $1
    done
  fi
}

# call a script to adjust padding variables
source ~/.config/yabai/scripts/update.zsh

if update_yabai; then
  exit 0
else
  # get index of all spaces using stack layout
  stacked_spaces=($(yabai -m query --spaces --display | jq -re '.[] | select( .type == "stack" ) | .index '))

  # call functions to set padding
  set_global_padding $YABAI_BSP_PADDING
  set_stacks_padding $YABAI_STACK_PADDING
fi
