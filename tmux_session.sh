#!/bin/bash

# mind palace
start_mp_session() {
  tmux new-session -d -s "mp" &&
    # window 1
    tmux renamew "scripts" &&

    ## splits
    tmux splitw -h -t 1 &&
    tmux splitw -v &&
    tmux splitw -v &&
    tmux splitw -v -t 1 &&

    ## sizes
    tmux resizep -t ":1.4" -R 38 &&
    tmux resizep -t ":1.4" -U 1 &&
    tmux resizep -t ":1.3" -U 14 &&
    tmux resizep -t ":1.2" -D 8 &&

    ## commands
    tmux send-keys -t ":1.1" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&
    tmux send-keys -t ":1.2" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&
    tmux send-keys -t ":1.3" htop Enter &&
    tmux send-keys -t ":1.4" "watch -n 1 nvidia-smi" Enter &&
    tmux send-keys -t ":1.5" "source $(poetry env info --path)/bin/activate.fish && make vdb ARGS=start && clear" Enter &&

    # window 2
    tmux neww &&
    tmux renamew "nvim" &&

    ## commands
    tmux send-keys -t ":2.1" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&

    # window 3
    tmux neww &&
    tmux renamew "misc" &&

    # attach
    tmux selectw -t "1" &&
    tmux selectp -t "1" &&
    tmux a -t "mp"
}

start_default_session() {
  local session_name="$1"
  local attach_flag="$2"

  tmux new-session -d -s "$session_name" &&
    # window 1
    tmux renamew "scripts" &&

    ## splits
    tmux splitw -h -t 1 &&
    tmux splitw -v &&
    tmux splitw -v &&
    tmux splitw -v -t 1 &&

    ## sizes
    tmux resizep -t ":1.4" -R 38 &&
    tmux resizep -t ":1.4" -U 1 &&
    tmux resizep -t ":1.3" -U 14 &&
    tmux resizep -t ":1.2" -D 8 &&

    # ## commands
    # tmux send-keys -t ":1.1" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&
    # tmux send-keys -t ":1.2" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&
    tmux send-keys -t ":1.3" htop Enter &&
    # tmux send-keys -t ":1.4" "watch -n 1 nvidia-smi" Enter &&
    # tmux send-keys -t ":1.5" "source $(poetry env info --path)/bin/activate.fish && make vdb ARGS=start && clear" Enter &&

    # window 2
    tmux neww &&
    tmux renamew "nvim" &&

    # ## commands
    # tmux send-keys -t ":2.1" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&

    # window 3
    tmux neww &&
    tmux renamew "misc" &&

    # attach
    tmux selectw -t "1" &&
    tmux selectp -t "1" &&
    if [[ "$attach_flag" == "-a" ]]; then
      tmux attach -t "$session_name"
    fi
}

start_session() {
  local sname attach_flag

  if [[ "$#" -ge 1 ]]; then
    sname="$1"
    attach_flag="$2"
  else
    while read -p "Session name: " sname; do
      if [[ -n "$sname" ]]; then
        break
      fi
    done
  fi

  start_default_session "$sname" "$attach_flag"
}

case $1 in
mp)
  start_mp_session
  ;;
*)
  start_session "$1" "$2"
  ;;
esac
