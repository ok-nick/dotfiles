{
  pkgs,
  config,
  ...
}: {
  programs.swaylock = {
    enable = true;
    # package = pkgs.swaylock-effects;
    settings = {
      font = "Jost *";
      image = config.wallpaper;
      show-failed-attempts = true;
      # ignore-empty-password = true;

      # effect-blur = "10x5";
    };
  };
}
