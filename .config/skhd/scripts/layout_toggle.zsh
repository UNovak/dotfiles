#!/bin/zsh
current=$(yabai -m query --spaces --space | jq -r .type)

if [[ "$current" == "bsp" ]]; then
  new="stack"
  yabai -m space --layout "$new"
  yabai -m config left_padding 28
else
  new="bsp"
  yabai -m space --layout "$new"
  yabai -m config left_padding 8
fi
