{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.git = {
    enable = true;
    # NOTE: causes issues where I have to input passphrase multiple times
    # lfs.enable = true;
    signing = {
      signByDefault = true;
      # key = "E6F3F722530600D2";
      key = "CFC1F23DFE7B706B";
    };
    settings = {
      user = {
        name = "ok-nick";
        email = "nick.libraries@gmail.com";
      };
      # feature.manyFiles = true; # NOTE: causes issues with `cargo doc`
      # core = {
      #   fsmonitor = true;
      #   # untrackedcache = true;
      # };
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };
}
