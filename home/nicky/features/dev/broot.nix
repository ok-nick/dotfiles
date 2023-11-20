{pkgs, config, ...}: {
  programs.broot = {
    # TODO: theme
    enable = true;
    settings = {
      default_flags = "g";
      capture_mouse = false;
      verbs = [
        {
          key = "ctrl-l";
          internal = ":panel_right_no_open";
        }
        {
          key = "ctrl-h";
          internal = ":panel_left_no_open";
        }
        {
          key = "ctrl-w";
          internal = ":input_del_word_left";
        }
        {
          invocation = "edit";
          shortcut = "e";
          external = "$EDITOR +{line} {file}";
          leave_broot = false;
        }
      ];
    };
  };

  # TODO: make a more general config for this
  xdg.desktopEntries = {
    broot = {
      name = "broot";
      exec = "${config.terminal} --command ${pkgs.broot}/bin/broot";
      mimeType = ["inode/directory"];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = ["broot.desktop"];
  };
}
