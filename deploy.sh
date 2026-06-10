#!/bin/bash

set -eu

SCRIPT_DIR="$(pwd)"

linkfiles() {
        
    echo "Linking dotfiles from $SCRIPT_DIR..."

    ln -sfn "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
    ln -sfn "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
    ln -sfn "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"

    # emacs configs

    mkdir -p "$HOME/.config/emacs/autosaves"
    mkdir -p "$HOME/.config/emacs/backups"

    ln -sfn "$SCRIPT_DIR/.emacs" "$HOME/.emacs"
    ln -sfn "$SCRIPT_DIR/.config/emacs/emacs.custom.el" "$HOME/.config/emacs/emacs.custom.el"


    if [[ "$(uname)" == "Linux" ]]; then
        echo "Do things for Linux"
    fi
}

unlink() {
    echo "Unlinking all dotfiles..."

    rm "$HOME/.vimrc"
    rm "$HOME/.tmux.conf"
    rm "$HOME/.gitconfig"
    rm "$HOME/.emacs"
    rm "$HOME/.config/emacs/emacs.custom.el"

    if [[ "$(uname)" == "Linux" ]]; then
        echo "Do things for Linux"
    fi
}

if [[ $# -eq 1 ]]; then
    "$@"
elif [[ $# -gt 1 ]]; then
    echo "Multiple command is not allowed"
    echo "Usage: ./deploy.sh command"
else
    echo "Usage: ./deploy.sh command"
fi

