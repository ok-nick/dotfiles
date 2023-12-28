{pkgs, ...}: {
  # TODO: add custom fonts
  home.packages = with pkgs; [
    # TODO: marked as broken?
    # font-manager

    corefonts
    vistafonts

    # ibm-plex
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    # material-symbols # eww-hyperland
    # jost # eww-hyperland
    font-awesome # swappy
    roboto-mono
    montserrat
  ];

  fonts.fontconfig.enable = true;
}
