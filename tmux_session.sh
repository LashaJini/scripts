#!/bin/bash
start_session () {
  tmux new-session -d -s "$1" &&
    tmux split-window -v -t 1 'htop' &&
    tmux new-window &&
    tmux previous-window &&
    tmux select-pane -t 1 &&
    tmux resize-pane -D 30 &&
    tmux a -t "$1"
}

if [[ "$#" -eq 1 ]]; then
  start_session $1
else
  while read -p "Session name: " sname ; do
    if [ ${#sname} -ge 1 ]; then
      start_session $sname
      break
    fi
  done
fi

