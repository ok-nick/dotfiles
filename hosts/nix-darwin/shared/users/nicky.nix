{pkgs, ...}: {
  system.primaryUser = "nicky";

  users.users.nicky = {
    home = /Users/nicky;
    shell = pkgs.fish;
  };
}
