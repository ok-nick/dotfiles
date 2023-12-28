{
  programs.git = {
    enable = true;
    userName = "ok-nick";
    userEmail = "nick.libraries@gmail.com";
    delta = {
      enable = true;
    };
    lfs.enable = true;
    signing = {
      signByDefault = true;
      # key = "E6F3F722530600D2";
      key = "CFC1F23DFE7B706B";
    };
    extraConfig = {
      # feature.manyFiles = true; # NOTE: causes issues with `cargo doc`
      init.defaultBranch = "main";
    };
  };
}
