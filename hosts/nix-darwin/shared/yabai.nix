{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      window_topmost = true;
      mouse_modifier = "fn"; # rebinded to option key via karabiner-elements
      mouse_action1 = "move";
      window_animation_duration = "0.15";
      window_animation_easing = "ease_out_circ";
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
      yabai -m rule --add app="^Minecraft$" manage=off

      # 10 spaces for 0-9
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
      yabai -m space --create
    '';
  };
}
