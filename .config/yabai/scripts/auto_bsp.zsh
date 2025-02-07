#!/bin/zsh
# this script is called whenever a window is closed
# handles changing the layout to bsp if there is only one non-floating window

# get layout of current space
space=$(yabai -m query --spaces --space | jq -r '.')
read -r layout index <<< $(jq -r '[.type, .index] | @tsv' <<< $space)


# if current layout not stack exit
[[ "$layout" != "stack" ]] && exit 0

# count of all non floating windows on current space
window_count=$(yabai -m query --windows --space | jq ' [ .[] | select( ."is-floating" == false ) ] | length')

# if there is only 1 window
if [[ "$window_count" -lt 2 ]]; then

  # read current padding config settings
  source ~/.config/yabai/padding.conf

  # switch layout
  yabai -m space --layout bsp

  # set padding
  yabai -m config --space $index top_padding $YABAI_BSP_PADDING \
                                right_padding $YABAI_BSP_PADDING \
                                bottom_padding $YABAI_BSP_PADDING \
                                left_padding $YABAI_BSP_PADDING \
                                window_gap $(( YABAI_BSP_PADDING / 4 ))

  # reset window opacity
  yabai -m config window_opacity on \
                  active_window_opacity 0.96 \
                  normal_window_opacity 0.90
fi
