#!/bin/zsh
current_layout=$(yabai -m query --spaces --space | jq -r .type)
space_index=$(yabai -m query --spaces --space | jq -r .index)
window_count=$(yabai -m query --windows --space | jq length)

if [[ "$current_layout" == "bsp" && $window_count -ge 2 ]]; then
  new="stack"
  yabai -m space --layout "$new"
  yabai -m config --space $space_index top_padding 32
  yabai -m config --space $space_index right_padding 32
  yabai -m config --space $space_index bottom_padding 32
  yabai -m config --space $space_index left_padding 32
elif [[ "$current_layout" == "stack" ]]; then
  new="bsp"
  yabai -m space --layout "$new"
  yabai -m config --space $space_index top_padding 16
  yabai -m config --space $space_index right_padding 16
  yabai -m config --space $space_index bottom_padding 16
  yabai -m config --space $space_index left_padding 16
fi
