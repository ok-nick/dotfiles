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
      # yabai -m rule --add title="Software Update" manage=off
      # yabai -m rule --add app="System Information" title="About This Mac" manage=off
    '';
  };
}
