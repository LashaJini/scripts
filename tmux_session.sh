#!/bin/bash

# its ugly, ik, idc.
start_default_session() {
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
		tmux a -t "$sname"
}

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

start_mp_session2() {
	tmux new-session -d -s "mp" &&
		# window 1
		tmux renamew "scripts" &&

		## splits
		tmux splitw -v -t 1 &&
		tmux splitw -v &&
		tmux splitw -v &&
		tmux splitw -v -t 1 &&

		## sizes
		# tmux resizep -t ":1.1" -U 90 &&
		# tmux resizep -t ":1.4" -U 10 &&
		# tmux resizep -t ":1.3" -U 25 &&
		# tmux resizep -t ":1.2" -D 5 &&
		# tmux resizep -t ":1.2" -D 8 &&

		## commands
		tmux send-keys -t ":1.1" htop Enter &&
		tmux send-keys -t ":1.2" "watch -n 1 nvidia-smi" Enter &&
		tmux send-keys -t ":1.3" "source $(poetry env info --path)/bin/activate.fish && make vdb ARGS=start && clear" Enter &&
		tmux send-keys -t ":1.4" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&
		tmux send-keys -t ":1.5" "source $(poetry env info --path)/bin/activate.fish && clear" Enter &&

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

start_session() {
	if [[ "$#" -eq 1 ]]; then
		start_default_session $1
	else
		while read -p "Session name: " sname; do
			if [ ${#sname} -ge 1 ]; then
				start_default_session $sname
				break
			fi
		done
	fi
}

case $1 in
mp)
	start_mp_session
	;;
mp2)
	start_mp_session2
	;;
*)
	start_session $1
	;;
esac
