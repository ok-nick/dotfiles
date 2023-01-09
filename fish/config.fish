# https://wiki.archlinux.org/title/sway#No_visible_cursor
set -Ux WLR_NO_HARDWARE_CURSORS 1
# use vulkan
set -Ux WLR_RENDERER vulkan
# wayland on firefox
set -Ux MOZ_ENABLE_WAYLAND 1

set -x EDITOR ~/.local/share/neovim/bin/nvim
set -x DOTFILES ~/dotfiles
# gpg agent for signing git commits
set -x GPG_TTY (tty)
# for ssh agent to be used with gnome-keyring
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh
# use bash for sxhkd scripting
set -x SXHKD_SHELL /usr/bin/bash

# $PATH variables
fish_add_path ~/.local/share/neovim/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# load theme
source $DOTFILES/fish/themes/kanagawa.fish

if status --is-login
    # only on tty1 automatically launch sway
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        # sway doesn't officially supported nvidia
        exec sway --unsupported-gpu
    end

    # passes environment variables to dbus, required for gnome-keyring
    dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
    # starts up gnome-keyring with ssh key support
    # /dev/null to hide output
    gnome-keyring-daemon --start --components=secrets,ssh &> /dev/null
end

# TODO: manually input zoxide shell completions? Move all this to separate files

# zoxide shell completions
if type -q zoxide
    zoxide init fish | source
end

# wasmer shell completions
export WASMER_DIR="~/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
