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
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      yubikey-manager-qt # TODO: move to feature
      bitwarden
      vial
      libsForQt5.kdenlive
      winetricks
      wineWowPackages.waylandFull
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
    ];
}
