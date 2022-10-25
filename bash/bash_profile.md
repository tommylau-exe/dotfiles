---
title: bash_profile
author: Tom Lauerman <tom@lauerman.dev>
date: July 15, 2022
tangle: ~/.bash_profile
---
# bash_profile

`.bash_profile` is read and executed when Bash is invoked as an interactive
login shell.

Thus, it should contain commands that should be run exactly once, such as
customizing the `$PATH` variable.

```bash
# If interactive, and .bashrc exists (and is readable), source .bashrc
[ -n "$PS1" ] && [ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"
```

## Exports
### PATH

Adds the following components to the `PATH` (in order):
- User binaries

```bash
path_overrides=(
    "$HOME/.local/bin"
)

# Prepend the path overrides, colon-separated
PATH="$(printf "%s:" "${path_overrides[@]}")$PATH"
export PATH
```

### EDITOR

Try to set the following editors as `EDITOR`, if they exist (in order):
- neovim
- vim
- vi

```bash
editors=(
    '/usr/bin/nvim'
    '/usr/bin/vim'
    '/usr/bin/vi'
)

for e in ${editors[@]}; do
    if command -v "$e" &> /dev/null; then
        EDITOR="$e"
        break
    fi
done
export EDITOR
```

## System-specific configuration

Source external files, like those supplied by development toolchains
(`rustup`, etc.).

Sources external files for system-specific configuration, like development
toolchains. Any files in `~/.bash_profile.d/` will be sourced.

```bash
dot_d="$HOME/.bash_profile.d"

if [ -d "$dot_d" ]; then
    for f in "$dot_d"/*; do
        . "$f"
    done
fi
```

For example, a file `~/bash_profile.d/rustup.bash` that sources the
`rustup` toolchain's environment.
