#!/bin/bash

# its ugly, ik, idc.
start_session () {
  tmux new-session -d -s "$1" &&
    tmux split-window -v -t 1 'htop' &&
    tmux rename-window "SCRIPTS" &&
    tmux new-window &&
    tmux rename-window "NVIM" &&
    tmux previous-window &&
    tmux select-pane -t 1 &&
    tmux resize-pane -D 18 &&
    tmux new-window &&
    tmux rename-window "TESTS" &&
    tmux split-window -h &&
    tmux new-window &&
    tmux rename-window "MISC" &&
    tmux next-window &&
    tmux split-window -h &&
    tmux select-pane -L &&
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

