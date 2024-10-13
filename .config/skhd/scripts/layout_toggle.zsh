#!/bin/zsh
current=$(yabai -m query --spaces --space | jq -r .type)
window_count=$(yabai -m query --windows --space | jq length)

if [[ "$current" == "bsp" && $window_count -ge 2 ]]; then
  new="stack"
  yabai -m space --layout "$new"
  yabai -m config left_padding 28
elif [[ "$current" == "stack" ]]; then
  new="bsp"
  yabai -m space --layout "$new"
  yabai -m config left_padding 8
fi
