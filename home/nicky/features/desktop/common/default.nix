{pkgs, ...}: {
  imports = [
    ./discord.nix
    ./firefox.nix
    ./font.nix
    ./gtk.nix
    ./qt.nix
    ./imv.nix
    ./mpv.nix
  ];

  programs = {
    pandoc.enable = true;
    obs-studio.enable = true;
  };

  # TODO: add optional modules
  services = {
    playerctld.enable = true;
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };

  # TODO: fix tray.target not found
  # https://github.com/nix-community/home-manager/issues/2064#issuecomment-887300055
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.target"];
    };
  };

  home.packages = with pkgs; [
    # davinci-resolve # https://github.com/NixOS/nixpkgs/issues/246565
    libsForQt5.kdenlive
    tesseract
    nix-tree
    networkmanagerapplet
    ookla-speedtest
    vial
    winetricks
    wineWowPackages.waylandFull
    grapejuice
    polkit_gnome
    libsForQt5.polkit-kde-agent
    gnome.gnome-disk-utility
    xorg.xeyes
    libreoffice-fresh
    xdg-utils
    polychromatic
    pavucontrol
    bitwarden
    xclip
    gimp
    yubikey-manager-qt # TODO: move to feature
  ];
}
