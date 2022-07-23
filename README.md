# tom's dots

```
 _                  _           _       _                          ☆ * . ☆
| |_ ___  _ __ ___ ( )___    __| | ___ | |_ ___   __   __   __  ⠀⠀⠀⠀. ∧＿∧ ∩ * ☆
| __/ _ \| '_ ` _ \|// __|  / _` |/ _ \| __/ __| /  \ /  \ /  \ ⠀* ☆ ( ・∀・)/ .
| || (_) | | | | | | \__ \ | (_| | (_) | |_\__ \ \__/ \__/ \__/ ⠀⠀. ⊂⠀⠀⠀⠀ノ* ☆
 \__\___/|_| |_| |_| |___/  \__,_|\___/ \__|___/                ⠀⠀☆ * (つ ノ .☆
                                                                ⠀⠀⠀⠀⠀⠀(ノ
```

# Files

- bash
  - [bash_profile](/bash/bash_profile.md)
  - [bashrc](/bash/bashrc.md)
- nvim
  - [init.lua](/nvim/init.lua.md)

# Organization

My dotfiles are separated by program and are all formatted as [literate
programming][1]-style markdown files, inspired by Emacs' [org-mode][2]. The
format is of my own invention, and my custom installation script implements it.
Each file corresponds to one generated config file. See [Format](#format) for
details.

## Format

The file format is identical to standard Markdown with the frontmatter
extension. The only thing I added is the frontmatter property `tangle`, which
specifies the output file path of the generated code.

Upon running `tangle.sh`, the contents of all specified files' code blocks will
be output to their respective `tangle` property. By default, overwriting files
is forbidden, and there is a dry-run option available to prevent accidental
data loss.

# Installation

This repo comes with it's own POSIX-compliant installation script, so setup
should be pretty straightforward. Run `./tangle.sh -h` for more information.

# Tom's tips and tricks

## System specific configuration in bash

Both my [bashrc](/bash/bashrc.md) and [bash_profile](/bash/bash_profile.md)
source directories for system-specific extensions (`~/.bashrc.d/` and
`~/.bash_profile.d/` respectively). These can be used for aliases, or any other
initialization code that may not belong in this repo.
    
For example, here's an example that configures `rustup`:

```bash
#!/usr/bin/env bash
#
# ~/.bash_profile.d/rustup.bash
#

. "$HOME/.cargo/env"
```

[1]: https://en.wikipedia.org/wiki/Literate_programming
[2]: https://orgmode.org/