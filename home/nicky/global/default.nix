{outputs, ...}: {
  imports = [outputs.homeManagerModules];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs = {
    home-manager.enable = true;
    obs-studio.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  xdg = {
    enable = true;
    mimeApps.enable = true;
  };

  home = rec {
    username = "nicky";
    homeDirectory = "/home/${username}";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.05";
  };
}
