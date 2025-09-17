#!/bin/bash

set -eu

SCRIPT_DIR="$(pwd)"

linkfiles() {
		
	echo "Linking dotfiles from $SCRIPT_DIR..."

	ln -sfn "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
	ln -sfn "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
	ln -sfn "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"

}

unlink() {
	echo "Unlinking all dotfiles..."

	rm "$HOME/.vimrc"
	rm "$HOME/.tmux.conf"
	rm "$HOME/.gitconfig"
}

if [[ $# -eq 1 ]]; then
	"$@"
elif [[ $# -gt 1 ]]; then
	echo "Multiple command is not allowed"
	echo "Usage: ./deploy.sh command"
else
	echo "Usage: ./deploy.sh command"
fi

