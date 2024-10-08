#!/usr/bin/env bash
# Allow the user to select projects via fzf
#

fzf_tmux() {
	SELECTED_PROJECTS=$(tmuxinator list -n |
		tail -n +2 |
		fzf --prompt="Project: " -m -1 -q "$1")

	if [ -n "$SELECTED_PROJECTS" ]; then
		# Set the IFS to \n to iterate over \n delimited projects
		IFS=$'\n'

		# Start each project without attaching
		for PROJECT in $SELECTED_PROJECTS; do
			tmuxinator start "$PROJECT" --no-attach # force disable attaching
		done

		# If inside tmux then select session to switch, otherwise just attach
		if [ -n "$TMUX" ]; then
			SESSION=$(tmux list-sessions -F "#S" | fzf --prompt="Session: ")
			if [ -n "$SESSION" ]; then
				tmux switch-client -t "$SESSION"
			fi
		else
			tmux attach-session
		fi
	fi
}

alias ts="fzf_tmux"
