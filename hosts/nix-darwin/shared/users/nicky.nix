{pkgs, ...}: {
  system.primaryUser = "nicky";

  # to set fish as default shell https://github.com/nix-darwin/nix-darwin/issues/1237
  users.knownUsers = ["nicky"];

  users.users.nicky = {
    home = /Users/nicky;
    # found by calling "id -u" this is needed for knownUsers which is needed to set fish as default shell
    uid = 501;
    shell = pkgs.fish;
  };
}
