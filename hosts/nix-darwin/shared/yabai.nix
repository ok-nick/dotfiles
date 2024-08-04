{pkgs, ...}: {
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
      yabai -m rule --add app="^FaceTime$" manage=off
      yabai -m rule --add app="^Music$" title="^MiniPlayer$" manage=off
      yabai -m rule --add app="^Photo Booth$" manage=off

      # delete >10 spaces
      for _ in $(yabai -m query --spaces | ${pkgs.jq}/bin/jq '.[].index | select(. > 10)'); do
        yabai -m space --destroy 11
      done

      function preallocate_space {
        local idx="$1"
        local space=

        space=$(yabai -m query --spaces --space "$idx")
        if [ -z "$space" ]; then
          yabai -m space --create
        fi
      }

      # 10 spaces for 0-9
      preallocate_space 1
      preallocate_space 2
      preallocate_space 3
      preallocate_space 4
      preallocate_space 5
      preallocate_space 6
      preallocate_space 7
      preallocate_space 8
      preallocate_space 9
      preallocate_space 10

      ${pkgs.jankyborders}/bin/borders active_color=0xffe1e3e4 style=square width=4.0 &
    '';
  };
}
