{...}: {
  programs.imv = {
    enable = true;
  };

  xdg.mimeApps = {
    associations.added = {
      "image/*" = ["imv.desktop"];
    };
    defaultApplications = {
      "image/*" = ["imv.desktop"];
    };
  };
}
