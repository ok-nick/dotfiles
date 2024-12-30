{inputs, ...}: {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];

  # environment.systemPath = [/opt/homebrew/bin];

  homebrew = {
    enable = true;
    # use the nix brewfile for everything homebrew commands
    global.brewfile = true;
    onActivation = {
      # updates stuff on rebuild
      # autoUpdate = true;
      # cleanup stuff not defined in nix config
      cleanup = "zap";
    };
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = false;

    # TODO: define globally
    user = "nicky";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
    };

    mutableTaps = false;
    autoMigrate = true;
  };
}
