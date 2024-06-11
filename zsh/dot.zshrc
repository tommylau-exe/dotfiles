#!/usr/bin/env zsh

# bash-like key bindings
bindkey -e

# enable built-in git autocompletion, case sensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# aliases
alias zshrc="$EDITOR ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias vimrc="$EDITOR ~/.config/nvim/"

# source system-specific config
dot_d="$HOME/.zshrc.d"
if [ -d "$dot_d" ]; then
    for f in "$dot_d"/*; do
        . "$f"
    done
fi
