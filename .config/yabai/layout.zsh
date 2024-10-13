#!/bin/zsh
window_count=$(yabai -m query --windows --space | jq length)
current=$(yabai -m query --spaces --space | jq -r .type)

# If there is only 1 window and the layout is 'stack', switch to 'bsp'
if [[ "$window_count" -eq 1 && "$current" == "stack" ]]; then
  yabai -m space --layout bsp
  yabai -m config left_padding 8
fi
