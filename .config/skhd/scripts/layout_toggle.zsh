#!/bin/zsh
# A script that is run manually with skhd to switch between bsp and stack layout

read -r layout index <<< $(yabai -m query --spaces --space | jq -r '[ .type, .index ] | @tsv')

# read current padding settings
source ~/.config/yabai/padding.conf

if [[ "$layout" == "bsp" ]]; then

  window_count=$(yabai -m query --windows --space | jq ' [ .[] | select( ."is-floating" == false ) ] | length')
  [[ "$window_count" -le 1 ]] && exit 0

  # set layout to stack
  yabai -m space --layout "stack"

  # set padding
  yabai -m config --space $index top_padding $YABAI_STACK_PADDING \
                                  right_padding $YABAI_STACK_PADDING \
                                  bottom_padding $YABAI_STACK_PADDING \
                                  left_padding $YABAI_STACK_PADDING

  # disable window opacity
  yabai -m config active_window_opacity 0.99 \
                  normal_window_opacity 1.0

else
  # set layout to bsp
  yabai -m space --layout "bsp"

  # set padding
  yabai -m config --space $index top_padding $YABAI_BSP_PADDING \
                                right_padding $YABAI_BSP_PADDING \
                                bottom_padding $YABAI_BSP_PADDING \
                                left_padding $YABAI_BSP_PADDING \
                                window_gap $(( $YABAI_BSP_PADDING / 4 ))

  # re-enable window opacity
  yabai -m config active_window_opacity 0.96 \
                  normal_window_opacity 0.90
fi
