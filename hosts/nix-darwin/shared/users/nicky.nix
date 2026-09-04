{pkgs, ...}: let
  username = "nicky";
in {
  system.primaryUser = username;

  # to set fish as default shell https://github.com/nix-darwin/nix-darwin/issues/1237
  users.knownUsers = [username];

  users.users.${username} = {
    home = /Users/${username};
    # found by calling "id -u" this is needed for knownUsers which is needed to set fish as default shell
    uid = 501;
    shell = pkgs.fish;
  };

}
