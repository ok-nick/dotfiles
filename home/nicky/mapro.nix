{
  pkgs,
  outputs,
  ...
}: {
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
    # ../shared/desktop/witch.nix
    # ../shared/desktop/syncthing.nix

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

  # nixpkgs.overlays = [
  #   outputs.overlays.additions
  #   outputs.overlays.modifications
  # ];

  # wallpaper = "/persist/work/smiley.png";
  terminal = "${pkgs.alacritty}/bin/alacritty";

  # https://gist.github.com/trusktr/1e5e516df4e8032cbc3d
  # https://gist.github.com/Jimbly/9471958
  # https://gist.github.com/hym3242/4ade5dbcabbe547f3d78687897b8ddfe
  # https://gist.github.com/hym3242/8e8bc10a2fed8e55973c500f1798c234
  #
  # NOTE: https://gist.github.com/trusktr/1e5e516df4e8032cbc3d?permalink_comment_id=5123916#gistcomment-5123916
  # need to disable mission control keybind to get it to work ^
  # targets.darwin.keybindings = {
  #   # ctrl + delete
  #   "^\\UF728" = "deleteWordBackward:";
  #   # ctrl + left arrow
  #   "^\\UF702" = "moveWordBackward:";
  #   # ctrl + right arrow
  #   "^\\UF703" = "moveWordForward:";
  #   # shift + ctrl + left arrowgs
  #   "$^\\UF702" = "moveWordBackwardAndModifySelection:";
  #   # shift + ctrl + right arrow
  #   "$^\\UF703" = "moveWordForwardAndModifySelection:";

  #   # TODO: ^[ ^] move par
  # };

  # TODO: https://github.com/nix-community/home-manager/issues/6120
  home = {
    # TODO: doesn't really work on things like google docs
    # activation.setCocoaKeybindingsOverride = let
    #   keybindings_path = "${config.home.homeDirectory}/Library/KeyBindings/DefaultKeyBinding.dict";
    # in
    #   lib.hm.dag.entryAfter ["writeBoundary"] ''
    #     ${pkgs.coreutils}/bin/cat > ${keybindings_path} << EOF
    #     {
    #       "^\UF728" = "deleteWordBackward:";
    #       "^\U007F" = "deleteWordBackward:";
    #       "^\UF702" = "moveWordBackward:";
    #       "^\UF703" = "moveWordForward:";
    #       "^$\UF702" = "moveWordBackwardAndModifySelection:";
    #       "^$\UF703" = "moveWordForwardAndModifySelection:";
    #     }
    #     EOF
    #   '';

    # TODO: generalize this into module
    # remove "Last login" line when opening terminal
    file.".hushlogin".text = "";
  };

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
    c2patool
    # wireshark
    cmake
    # TODO: temp
    # python312Packages.jupyterlab
    # iina
    nh
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
