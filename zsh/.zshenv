export XDG_CONFIG_HOME="$HOME/.config"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="$HOME/.local/share/neovim/bin/nvim"
export DOTFILES="$HOME/dotfiles"
export WALLPAPER="$HOME/Wallpapers/default.png"

# https://wiki.archlinux.org/title/sway#No_visible_cursor
export WLR_NO_HARDWARE_CURSORS=1
# use vulkan
export WLR_RENDERER="vulkan"
# wayland on firefox
export MOZ_ENABLE_WAYLAND=1
# better firefox scrolling
export MOZ_USE_XINPUT2=1

# gpg agent for signing git commits
export GPG_TTY="(tty)"
# for ssh agent to be used with gnome-keyring
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
# use bash for sxhkd scripting
export SXHKD_SHELL="/usr/bin/bash"
# use dark theme for GTK apps
export GTK_THEME="Adwaita:dark"

export PATH="$PATH:$HOME/.local/share/neovim/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
