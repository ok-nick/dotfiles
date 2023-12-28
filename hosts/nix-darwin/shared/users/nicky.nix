{pkgs, ...}: {
  users.users.nicky = {
    home = /Users/nicky;
    shell = "${pkgs.fish}/bin/fish";
  };
}
