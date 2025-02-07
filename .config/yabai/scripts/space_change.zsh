#!/bin/zsh
# A script that is run whenever user changes focus to a new space

id=$YABAI_SPACE_INDEX # mission control index

# get information about current space
space=$(yabai -m query --spaces --space $id)
read -r layout windows window_id <<< $(jq -r '[ .type, (.windows | length), ."last-window" ] | @tsv' <<< "$space")

# exit early if there are no windows
[[ $windows -eq 0 ]] && exit 0

# if there are windows adjust opacity based on layout
if [[ "$layout" == "stack" ]]; then
  yabai -m config active_window_opacity 0.99 \
                  normal_window_opacity 1.0
else
  yabai -m config active_window_opacity 0.96 \
                  normal_window_opacity 0.90
fi

# focus the first window on space
yabai -m window --focus $window_id
