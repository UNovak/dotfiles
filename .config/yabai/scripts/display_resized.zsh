#!/bin/zsh
# this script runs whenever a display is resized

# call a script to adjust padding variables
source ~/.config/yabai/scripts/set_padding.zsh

# get index of all spaces using stack layout
stacked_spaces=( $(yabai -m query --spaces --display | jq -re '.[] | select( .type == "stack" ) | .index ') )

# set global padding settings
function set_global_padding () {
  local padding=$1
  yabai -m config top_padding $padding \
                  bottom_padding $padding \
                  left_padding $padding \
                  right_padding $padding \
                  window_gap $(( $padding / 4 ))
}

# call handle stack for each space with stack layout
function set_stacks_padding () {
  if [[ ${#stacked_spaces[@]} -ne 0 ]]; then
    for index in ${stacked_spaces[@]}; do
      handle_stack $index $1
    done
  fi
}

# apply padding for stack layout
function handle_stack () {
  local index=$1
  local padding=$2
  yabai -m config --space $index top_padding $padding \
                                 right_padding $padding \
                                 bottom_padding $padding \
                                 left_padding $padding \
                                 window_gap $(( $padding / 4 ))
}

# call functions to set padding
set_global_padding $YABAI_BSP_PADDING
set_stacks_padding $YABAI_STACK_PADDING
