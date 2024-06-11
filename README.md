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

- zsh
  - [zshrc](/zsh/dot.zshrc)
  - [zshenv](/zsh/dot.zshenv)
- nvim
  - [config](/nvim/lua/tom)
  - [plugins](/nvim/lua/plugins)

# Organization

My dotfiles are split up into different folders by application. For example,
all the Neovim dotfiles are in the nvim folder. This is in contrast to some
dotfile repositories which attempt to do some fancy trickery with bare
repositories in the home directory. I prefer a more straightforward approach.

As a result, all the dotfiles have to be symlinked upon install. Each
application folder has a TARGET file which contains the path that app's
dotfiles should be linked to. TARGET file paths support the tilde symbol (`~`),
which is expanded to the user's `$HOME`.

Additionally, dotfiles with the prefix `dot.` will be transformed to `.` upon
linking. For example, `dot.zshrc` becomes `.zshrc`.

# Installation

This repo comes with a small [install](/install) script written in Perl. Simply
run `./install zsh nvim` and you should be all set.

# Tom's tips and tricks

## System specific configuration

Both my [zshrc](/zsh/dot.zshrc) and [zshenv](/zsh/dot.zshenv) source
directories for system-specific extensions (`~/.zshrc.d/` and `~/.zshenv.d/`
respectively). These can be used for aliases, or any other initialization code
that may not belong in this repo.
    
For example, here's an example that configures `rustup`:

```zsh
#
# ~/.zshenv.d/rustup.zsh
#

. "$HOME/.cargo/env"
```
