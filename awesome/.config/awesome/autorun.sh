#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# dual monitor, vertical 4k left 125%, main horiztonal 1440p
if ! xrandr | grep -q '4180 x 2880' ; then
  xrandr --output DVI-D-0 --off --output HDMI-0 --mode 3840x2160 --scale 0.75x0.75 --pos 0x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 2560x1440 --rate 165 --pos 1620x720 --rotate normal --output DP-5 --off --output HDMI-A-1-0 --off --output DisplayPort-1-0 --off --output DisplayPort-1-1 --off --output DisplayPort-1-2 --off
  xrandr -s 4180x2880
fi

run picom --config $HOME/.config/picom/picom.conf
run thunderbird
