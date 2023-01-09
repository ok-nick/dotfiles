#!/bin/bash

ln -snf ~/dotfiles/alacritty ~/.config/alacritty
ln -snf ~/dotfiles/nvim ~/.config/nvim
ln -snf ~/dotfiles/vale/.vale.ini ~/.vale.ini
ln -snf ~/dotfiles/broot ~/.config/broot
ln -snf ~/dotfiles/firefox ~/.mozilla/firefox/*.default-release
ln -snf ~/dotfiles/tridactyl ~/.config/tridactyl
ln -snf ~/dotfiles/fish ~/.config/fish
ln -snf ~/dotfiles/bspwm ~/.config/bspwm
ln -snf ~/dotfiles/sxhkd ~/.config/sxhkd
ln -snf ~/dotfiles/cargo/config.toml ~/.cargo/config.toml
ln -snf ~/dotfiles/sway ~/.config/sway
ln -snf ~/dotfiles/kanshi ~/.config/kanshi

sudo cp -r -i ~/dotfiles/systemd/. /etc/systemd/system
