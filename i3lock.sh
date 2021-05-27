#!/usr/bin/env bash

icon="$HOME/images/wallpapers/space.png"
tmpbg='/tmp/i3lock-screen.png'

# (( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -f -e -i "$tmpbg"
rm "$tmpbg"
