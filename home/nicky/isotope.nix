{pkgs, ...}: {
  imports = [
    ../shared/nix.nix

    ../shared/desktop/wms/hyprland
    ../shared/desktop/wayland.nix

    ../shared/desktop
    ../shared/desktop/firefox.nix
    ../shared/desktop/font.nix
    ../shared/desktop/gtk.nix
    ../shared/desktop/imv.nix
    ../shared/desktop/mpv.nix
    ../shared/desktop/qt.nix

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
    ../shared/dev/ssh.nix
    ../shared/dev/starship.nix
    ../shared/dev/tools.nix
    ../shared/dev/zsh.nix
  ];

  terminal = "${pkgs.alacritty}/bin/alacritty";

  # TODO: move this
  dconf.settings = {
    "org/blueman/plugins/powermanager" = {
      auto-power-on = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
