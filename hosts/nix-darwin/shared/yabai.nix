{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      window_topmost = true;
      mouse_modifier = "alt";
    };
    # TODO: broken
    # add for get info menu in finder as well, and activity monitor popup
    extraConfig = ''
      yabai -m rule --add app="^System Settings$" manage=off
      # TODO: doesn't work, iirc bitwarden changes the window name after creation
      yabai -m rule --add app="^Safari$" title="^Bitwarden$" manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^Activity Monitor$" manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Discord$" title="^Discord Updater$" manage=off
      yabai -m rule --add app="^Discord Canary$" title="^Discord Updater$" manage=off
    '';
  };
}
