---
title: bashrc
author: Tom Lauerman <tom@lauerman.dev>
date: July 15, 2022
tangle: ~/.bashrc
---
# bashrc

`.bashrc` is read and executed when Bash is invoked as a non-interactive
login shell.

Thus, it should contain aliases, functions, custom prompts, etc.

```bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
```
## Aliases

```bash
alias ls='ls --color=auto'
alias ll='ls -alh'
```

## Starship prompt

```bash
command -v starship &> /dev/null && eval "$(starship init bash)"
```

## System-specific configuration

Source external files, like per-system aliases.

```bash
dot_d="$HOME/.bashrc.d"

if [ -d "$dot_d" ]; then
    for f in "$dot_d"/*; do
        . "$f"
    done
fi
```

## MOTD

Print system information with neofetch, if available, and pipe through
lolcat, if available.

```bash
if command -v neofetch &> /dev/null; then
    neofetch \
        --disable \
            model \
            kernel \
            packages \
            resolution \
            theme \
            icons \
            wm wm_theme \
            term \
            gpu \
            cols \
        | if command -v lolcat &> /dev/null; then lolcat; else cat; fi
fi
```