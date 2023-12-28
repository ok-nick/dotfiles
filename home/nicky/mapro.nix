{pkgs, ...}: {
  imports = [
    ../shared/nix.nix

    # TODO: disperse desktop/default.nix
    ../shared/desktop
    ../shared/desktop/discord.nix
    # https://github.com/bandithedoge/nixpkgs-firefox-darwin
    # ../shared/desktop/firefox.nix
    ../shared/desktop/font.nix

    ../shared/dev/alacritty.nix
    ../shared/dev/bottom.nix
    ../shared/dev/broot.nix
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

  # TODO: move this
  home.packages = with pkgs; [
    cachix
    element-desktop
    zoom-us
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
