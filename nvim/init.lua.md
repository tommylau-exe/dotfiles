---
title: init.lua
author: Tom Lauerman <tom@lauerman.dev>
date: July 16, 2022
tangle: ~/.config/nvim/init.lua
---
# init.lua

I decided to go with `lua` for my `nvim` config this time around, as it has
first-class support in `neovim` and I'm more familiar with it than `vimscript`.

## Top-level variables

```lua
-- Detect if running in vscode-neovim plugin 
-- https://github.com/vscode-neovim/vscode-neovim
local vscode = vim.fn.exists 'g:vscode'
```

## General settings

Enable relative line numbers, mouse support, and remove weird vi-compatibility
options.

```lua
-- Enable relative line numbers for all but current line, which is absolute
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable mouse scrolling
vim.opt.mouse = 'a'

-- Disable unintuitive `vi`-compatible options. See `:h cpo-_`
vim.opt.cpoptions:remove{ '_' }
```
## Keymap

### Helper functions

Currently, just creating a shorthand for delcaring normal mode mappings in lua.

```lua
--- Set a mapping for `normal` mode.
--
-- The mapping will be silent and non-recursive by default. If running in
-- vscode-neovim, it will be recursive due to a plugin limitation.
-- @param lhs Key combo to map from
-- @param rhs Key combo to map to
-- @see vim.api.nvim_set_keymap
local function nmap(lhs, rhs)
    local noremap = not vscode
    vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = noremap, silent = true })
end
```

### Normal mode mappings

```lua
-- Spacevim style
vim.g.mapleader = ' '

-- Common operations
nmap('<leader>w', ':write<CR>')
nmap('<leader>q', ':q<CR>')
nmap('<leader>Z', 'ZZ')

-- Buffer manipulation
nmap('<leader>b', ':buffers<CR>')
nmap('<leader>n', ':bnext<CR>')
nmap('<leader>p', ':bprev<CR>')
nmap('<leader>d', ':bdelete<CR>')

-- Easier split navigation
nmap('<leader>h', '<C-w><C-h>')
nmap('<leader>j', '<C-w><C-j>')
nmap('<leader>k', '<C-w><C-k>')
nmap('<leader>l', '<C-w><C-l>')

-- Easier split movement
nmap('<leader>H', '<C-w>H')
nmap('<leader>J', '<C-w>J')
nmap('<leader>K', '<C-w>K')
nmap('<leader>L', '<C-w>L')

-- Toggle fold
nmap('<enter>', 'za')
```

## Plugins

For plugin configuration, I'm using [packer.nvim][1]. The following bootstrapping code was
pulled from [their Github page][2].

### Bootstrapping

```lua
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- Check if `packer` is already installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
```
### Plugin declaration

```lua
return require('packer').startup(function(use)
  -- Declare plugins here
  use 'wbthomason/packer.nvim' -- `packer` can manage itself
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- Automatically set up configure after cloning packer.nvim
  -- This must be after all plugin declarations
  if packer_bootstrap then
    require('packer').sync()
  end
end)
```

[1]: https://github.com/wbthomason/packer.nvim
[2]: https://github.com/wbthomason/packer.nvim#bootstrapping