{
  pkgs,
  outputs,
  ...
}: {
  imports = [outputs.homeManagerModules];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  xdg = {
    enable = pkgs.stdenv.isLinux;
    mimeApps.enable = pkgs.stdenv.isLinux;
  };

  home = rec {
    # TODO: unhardcode username
    username = "nicky";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
  };
}
