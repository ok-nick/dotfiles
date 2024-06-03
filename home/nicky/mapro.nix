{pkgs, ...}: {
  imports = [
    ../shared/nix.nix

    # TODO: disperse desktop/default.nix
    ../shared/desktop
    ../shared/desktop/apps.nix
    ../shared/desktop/discord.nix
    # https://github.com/bandithedoge/nixpkgs-firefox-darwin
    # ../shared/desktop/firefox.nix
    ../shared/desktop/font.nix
    ../shared/desktop/karabiner.nix
    ../shared/desktop/witch.nix
    ../shared/desktop/syncthing.nix

    ../shared/dev/alacritty.nix
    ../shared/dev/bottom.nix
    ../shared/dev/broot.nix
    ../shared/dev/direnv.nix
    ../shared/dev/editorconfig.nix
    ../shared/dev/fenix.nix
    ../shared/dev/fish.nix
    ../shared/dev/git.nix
    ../shared/dev/gpg.nix
    ../shared/dev/helix.nix
    ../shared/dev/neovim
    ../shared/dev/ssh.nix
    ../shared/dev/starship.nix
    ../shared/dev/tools.nix
    ../shared/dev/zsh.nix
  ];

  # wallpaper = "/persist/work/smiley.png";
  terminal = "${pkgs.alacritty}/bin/alacritty";

  # https://gist.github.com/trusktr/1e5e516df4e8032cbc3d
  # https://gist.github.com/Jimbly/9471958
  # https://gist.github.com/hym3242/4ade5dbcabbe547f3d78687897b8ddfe
  # https://gist.github.com/hym3242/8e8bc10a2fed8e55973c500f1798c234
  # targets.darwin.keybindings = {
  #   # ctrl + delete
  #   "^\UF728" = "deleteWordBackward:";
  #   # ctrl + left arrow
  #   "^\UF702" = "moveWordBackward:";
  #   # ctrl + right arrow
  #   "^\UF703" = "moveWordForward:";
  #   # shift + ctrl + left arrow
  #   "$^\UF702" = "moveWordBackwardAndModifySelection:";
  #   # shift + ctrl + right arrow
  #   "$^\UF703" = "moveWordForwardAndModifySelection:";

  #   # TODO: ^[ ^] move par
  # };

  # https://github.com/nix-community/comma
  # pretty cool stuff

  # TODO: slows down terminal considerably
  # programs.nix-index.enable = true;

  # TODO: search "darwin" in home manager options

  # TODO: move this
  home.packages = with pkgs; [
    cachix
    element-desktop
    zoom-us
    slack
    utm
    c2patool
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
