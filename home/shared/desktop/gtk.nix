{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    # theme = {
    #   name = "WhiteSur-Dark";
    #   package = pkgs.whitesur-gtk-theme;
    # };
    # iconTheme = {
    #   name = "WhiteSur";
    #   package = pkgs.whitesur-icon-theme;
    # };
  };
}
