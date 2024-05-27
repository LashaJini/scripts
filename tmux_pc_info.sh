#!/bin/bash

start_session () {
  tmux new-session -d -s "pc_info" 'watch sensors' &&
    tmux split-window -v -t 1 'nvtop' &&
    tmux split-window -h -t 2 'bmon' &&
    tmux split-window -h -t 1 'htop' &&
    tmux a -t "pc_info"
}

start_session
