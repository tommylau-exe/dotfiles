#!/usr/bin/env zsh

export EDITOR="nvim"

# source system-specific config
dot_d="$HOME/.zshenv.d"
if [ -d "$dot_d" ]; then
    for f in "$dot_d"/*; do
        . "$f"
    done
fi
