{pkgs, ...}: {
  home.packages = with pkgs; [swappy];

  # TODO: configure screenshot dir, etc.
  xdg.configFile."swappy/config".text = ''
    [Default]
    early_exit=true
  '';
}
