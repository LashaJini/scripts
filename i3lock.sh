#!/usr/bin/env bash

imgBg="$HOME/images/icons/kali.logo.scaled.png"
tmpbg='/tmp/i3lock-screen.png'

# (( $# )) && { bg=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$imgBg" -gravity center -composite -matte "$tmpbg"
i3lock -f -e -i "$tmpbg"
rm "$tmpbg"

# convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
# convert "$tmpbg" "$imgBg" -gravity center -composite -matte "$tmpbg"
# i3lock -f -e -i "$tmpbg"

# convert "$imgBg" -scale 75% "$tmpbg"
# i3lock -f -e -i "$tmpbg"
# rm "$tmpbg"
