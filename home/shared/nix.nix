{
  pkgs,
  outputs,
  ...
}: let
  # TODO: unhardcode username
  username = "nicky";
in {
  imports = [outputs.homeManagerModules];

  # nixpkgs.config = {
  #   allowUnfree = true;
  #   allowUnfreePredicate = _: true;
  # };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  xdg = {
    enable = pkgs.stdenv.isLinux;
    mimeApps.enable = pkgs.stdenv.isLinux;
  };

  home = {
    inherit username;
    # homeDirectory =
    #   if pkgs.stdenv.isDarwin
    #   then "/Users/${username}"
    #   else "/home/${username}";
  };
}
