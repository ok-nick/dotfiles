HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=5000000
SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_FCNTL_LOCK           # Better history writing.
setopt SHARE_HISTORY             # Share history between all sessions.

setopt GLOBDOTS                  # Complete hidden files.
setopt MENU_COMPLETE             # Complete on first tab.

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$DOTFILES/zsh/.zcompcache"

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

autoload -Uz compinit
compinit

bindkey '^f' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey "^[[1;5C" vi-forward-blank-word-end
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^z" undo
bindkey "^y" redo

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  # exec sway --unsupported-gpu

  # https://wiki.archlinux.org/title/GNOME/Keyring#Automatically_change_keyring_password_with_user_password
  dbus-update-activation-environment WAYLAND_DISPLAY
  # startup gnome-keyring with ssh support
  gnome-keyring-daemon --start --components=secrets,ssh
fi

