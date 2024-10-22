#!/bin/zsh
window_count=$(yabai -m query --windows --space | jq length)
space_index=$(yabai -m query --spaces --space | jq -r .index)
current_layout=$(yabai -m query --spaces --space | jq -r .type)

# If there is only 1 window and the layout is 'stack', switch to 'bsp'
if [[ "$window_count" -eq 1 && "$current_layout" == "stack" ]]; then
  yabai -m space --layout bsp
  yabai -m config --space $space_index top_padding 32
  yabai -m config --space $space_index right_padding 32
  yabai -m config --space $space_index bottom_padding 32
  yabai -m config --space $space_index left_padding 32
fi
