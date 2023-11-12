#!/bin/bash

polybar_height=15

while true; do
  window_height=$(xrandr | grep -m1 -oP '\d{3,}x\d+' | cut -d 'x' -f 2)
  mouse_y=$(xdotool getmouselocation | grep -oP 'y:\K\d+' | cut -d ':' -f 2)
  distance_from_bottom=$((window_height - mouse_y))

  if [ "$distance_from_bottom" -ge "$polybar_height" ]; then
    polybar-msg cmd hide
  else
    polybar-msg cmd show
  fi

  sleep 0.1
done
