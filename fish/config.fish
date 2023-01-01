fish_add_path ~/.local/share/neovim/bin
fish_add_path ~/.local/bin

set -x EDITOR ~/.local/share/neovim/bin/nvim
set -x DOTFILES ~/dotfiles
set -x SXHKD_SHELL /usr/bin/bash

source $DOTFILES/fish/themes/kanagawa.fish

zoxide init fish | source
