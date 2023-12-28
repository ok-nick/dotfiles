{
  programs.fish.loginShellInit = ''
    # homebrew needs to be manually configured...
    fish_add_path /opt/homebrew/bin
  '';

  # TODO: does this work for all shells?
  # environment.shellInit = ''
  #   export PATH=$PATH:/opt/homebrew/bin
  # '';
}
