#!/bin/zsh
current=$(yabai -m query --spaces --space | jq -r .type)

if [[ "$current" == "bsp" ]]; then
  new="stack"
  yabai -m space --layout "$new"
else
  new="bsp"
  yabai -m space --layout "$new"
fi
