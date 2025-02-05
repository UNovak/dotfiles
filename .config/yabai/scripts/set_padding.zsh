#!/bin/zsh
# Script that runs on yabai startup to determine what padding to use

# Query display dimensions and split into width and height
display=$(yabai -m query --displays --display)
IFS=$'\t' read -r display_width display_height <<< "$(jq -r '[.frame.w, .frame.h] | map(floor) | @tsv' <<< "$display")"

# Determine padding based on display size
if [[ $display_width -ge 2560 && $display_height -ge 1440 ]]; then
  export YABAI_BSP_PADDING=32
  export YABAI_STACK_PADDING=48
else
  export YABAI_BSP_PADDING=16
  export YABAI_STACK_PADDING=24
fi

config_file="$HOME/.config/yabai/padding.conf"

# Write the padding values to a config file for other scripts to source
{
  echo "YABAI_BSP_PADDING=$YABAI_BSP_PADDING"
  echo "YABAI_STACK_PADDING=$YABAI_STACK_PADDING"
} > "$config_file"

echo "set_padding" >> /tmp/yabai.script.log
