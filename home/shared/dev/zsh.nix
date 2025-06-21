{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    # TODO: other opts not in nix from original config
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    historySubstringSearch.enable = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.configHome}/zsh/.zsh_history";
      extended = true;
      expireDuplicatesFirst = true;
      size = 5000000;
      save = 5000000;
    };
    initExtra = ''
      # force emacs mode (prevents ESC going to vi mode)
      bindkey -e

      bindkey '^f' autosuggest-accept

      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^z" undo
      bindkey "^y" redo
    '';
    initExtraBeforeCompInit = ''
      setopt GLOB_DOTS
      setopt MENU_COMPLETE
      unsetopt HIST_VERIFY

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' completer _extensions _complete _approximate

      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "${config.xdg.configHome}/zsh/.zcompcache"
    '';
  };
}
