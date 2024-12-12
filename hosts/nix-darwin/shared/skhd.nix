{pkgs, ...}: {
  services.skhd = {
    # NOTE: moved to karabiner-elements via home-manager, skhd is difficult to use, less maintained, and has less features
    enable = true;
    skhdConfig = let
      # the least intrusive modifier
      mod = "alt";
    in ''
      # ${mod} - return : ${pkgs.alacritty}/bin/alacritty
      ${mod} - return : open -na /Applications/Alacritty.app
      # TODO; interferes with vim ctrl+w+l move focus window
      # lctrl - l : open -a ScreenSaverEngine

      # toggles yabai on/off (aka bsp/float)
      ${mod} - t : [ "$(yabai -m query --spaces --space | ${pkgs.jq}/bin/jq -r '.type')" = "bsp" ] && yabai -m space --layout float || yabai -m space --layout bsp

      # TODO: multi monitor
      # https://github.com/alacritty/alacritty/issues/3333#issuecomment-586516098
      ${mod} - h : yabai -m window --focus west || yabai -m display --focus west
      ${mod} - j : yabai -m window --focus south || yabai -m display --focus south
      ${mod} - k : yabai -m window --focus north || yabai -m display --focus north
      ${mod} - l : yabai -m window --focus east || yabai -m display --focus east
      ${mod} - left : yabai -m window --focus west || yabai -m display --focus west
      ${mod} - down : yabai -m window --focus south || yabai -m display --focus south
      ${mod} - up : yabai -m window --focus north || yabai -m display --focus north
      ${mod} - right : yabai -m window --focus east || yabai -m display --focus east

      shift + ${mod} - h : yabai -m window --warp west
      shift + ${mod} - j : yabai -m window --warp south
      shift + ${mod} - k : yabai -m window --warp north
      shift + ${mod} - l : yabai -m window --warp east
      shift + ${mod} - left : yabai -m window --warp west
      shift + ${mod} - down : yabai -m window --warp south
      shift + ${mod} - up : yabai -m window --warp north
      shift + ${mod} - right : yabai -m window --warp east

      # Move focus container to workspace
      shift + ${mod} - 1 : yabai -m window --space 1; yabai -m space --focus 1
      shift + ${mod} - 2 : yabai -m window --space 2; yabai -m space --focus 2
      shift + ${mod} - 3 : yabai -m window --space 3; yabai -m space --focus 3
      shift + ${mod} - 4 : yabai -m window --space 4; yabai -m space --focus 4
      shift + ${mod} - 5 : yabai -m window --space 5; yabai -m space --focus 5
      shift + ${mod} - 6 : yabai -m window --space 6; yabai -m space --focus 6
      shift + ${mod} - 7 : yabai -m window --space 7; yabai -m space --focus 7
      shift + ${mod} - 8 : yabai -m window --space 8; yabai -m space --focus 8
      shift + ${mod} - 9 : yabai -m window --space 9; yabai -m space --focus 9

      shift + ${mod} - space : yabai -m window --toggle float

      ${mod} - n : open -na Safari
      # TODO: open private safari window, requires crazy applescript

      # TODO: basically enable/disable yabai
      # shift + ${mod} - e : yabai -m space --toggle layout

      ${mod} - f : yabai -m window --toggle zoom-fullscreen
      shift + ${mod} - f : yabai -m window --toggle native-fullscreen

      # disable hiding applications, it's annoying
      cmd - h :
    '';
  };
}
