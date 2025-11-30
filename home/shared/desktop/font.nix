{pkgs, ...}: {
  # TODO: add custom fonts
  home.packages = with pkgs; [
    # TODO: marked as broken?
    # font-manager

    corefonts
    vista-fonts

    # ibm-plex
    noto-fonts
    # material-symbols # eww-hyperland
    # jost # eww-hyperland
    font-awesome # swappy
    roboto-mono
    montserrat
  ];

  fonts.fontconfig.enable = true;
}
