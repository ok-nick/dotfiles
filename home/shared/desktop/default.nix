{
  pkgs,
  lib,
  ...
}: {
  programs = {
    pandoc.enable = true;
    obs-studio.enable = pkgs.stdenv.isLinux;
  };

  # TODO: add optional modules
  services = {
    playerctld.enable = pkgs.stdenv.isLinux;
    blueman-applet.enable = pkgs.stdenv.isLinux;
    network-manager-applet.enable = pkgs.stdenv.isLinux;
  };

  # TODO: fix tray.target not found
  # https://github.com/nix-community/home-manager/issues/2064#issuecomment-887300055
  systemd.user.targets.tray = lib.mkIf pkgs.stdenv.isLinux {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.target"];
    };
  };

  home.packages = with pkgs;
    [
      # davinci-resolve # https://github.com/NixOS/nixpkgs/issues/246565
      tesseract
      nix-tree
      ookla-speedtest
      p7zip
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      yubikey-manager-qt # TODO: move to feature
      libsForQt5.kdenlive
      winetricks
      polkit_gnome
      libsForQt5.polkit-kde-agent
      gnome.gnome-disk-utility
      xorg.xeyes
      libreoffice-fresh
      xdg-utils
      polychromatic
      pavucontrol
      xclip
      gimp
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.isx86_64) [
      bitwarden
      vial
      wineWowPackages.waylandFull
    ];
}
