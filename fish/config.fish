fish_add_path ~/.local/share/neovim/bin

set -Ux EDITOR nvim
set -Ux DOTFILES ~/dotfiles

source $DOTFILES/fish/themes/kanagawa.fish

zoxide init fish | source
