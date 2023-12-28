{pkgs, lib, ...}: {
  programs.imv = {
    enable = true;
  };

  xdg.mimeApps = lib.mkIf pkgs.stdenv.isLinux {
    associations.added = {
      "image/*" = ["imv.desktop"];
    };
    defaultApplications = {
      "image/*" = ["imv.desktop"];
    };
  };
}
