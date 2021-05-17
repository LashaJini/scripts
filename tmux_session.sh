#!/bin/bash
# tmux new-session -d -s my_session &&
#   tmux ls

tmux new-session -d -s "$1" &&
  tmux split-window -v -t 1 'htop' &&
  tmux new-window &&
  tmux previous-window &&
  tmux select-pane -t 1 &&
  tmux a


# tmux new-session -d -s "$1" &&
#   tmux split-window -h &&
#   tmux split-window -v -t 1 'htop' &&
#   tmux select-pane -t 1 &&
#   tmux a

# tmux send-keys 'bundle exec thin start' 'C-m'
# tmux rename-window 'Foo'
# tmux select-window -t foo:0
# tmux send-keys 'bundle exec compass watch' 'C-m'
# tmux split-window -v -t 0 'exec pfoo'
# tmux send-keys 'rake ts:start' 'C-m'
# tmux split-window -v -t 1 'exec pfoo'
# tmux -2 attach-session -t foo
