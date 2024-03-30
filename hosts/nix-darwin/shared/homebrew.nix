{
  # environment.systemPath = [/opt/homebrew/bin];

  homebrew = {
    enable = true;
    # use the nix brewfile for everything homebrew commands
    global.brewfile = true;
    onActivation = {
      # updates stuff on rebuild
      autoUpdate = true;
      # cleanup stuff not defined in nix config
      cleanup = "zap";
    };
  };
}
