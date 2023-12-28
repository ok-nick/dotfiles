{pkgs, ...}: {
  services.skhd = {
    enable = true;
    # TODO: make mod key variable
    skhdConfig = ''
      # alt - return : ${pkgs.alacritty}/bin/alacritty
      alt - return : open -na /Applications/Alacritty.app
      # TODO; interferes with vim ctrl+w+l move focus window
      # lctrl - l : open -a ScreenSaverEngine

      # TODO: multi monitor
      # https://github.com/alacritty/alacritty/issues/3333#issuecomment-586516098
      alt - h : yabai -m window --focus west || yabai -m display --focus west
      alt - j : yabai -m window --focus south || yabai -m display --focus south
      alt - k : yabai -m window --focus north || yabai -m display --focus north
      alt - l : yabai -m window --focus east || yabai -m display --focus east
      # alt - left : yabai -m window --focus west || yabai -m display --focus west
      # alt - down : yabai -m window --focus south || yabai -m display --focus south
      # alt - up : yabai -m window --focus north || yabai -m display --focus north
      # alt - right : yabai -m window --focus east || yabai -m display --focus east

      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east
      shift + alt - left : yabai -m window --warp west
      shift + alt - down : yabai -m window --warp south
      shift + alt - up : yabai -m window --warp north
      shift + alt - right : yabai -m window --warp east

      # Move focus container to workspace
      shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
      shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
      shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
      shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4
      shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5
      shift + alt - 6 : yabai -m window --space 6; yabai -m space --focus 6
      shift + alt - 7 : yabai -m window --space 7; yabai -m space --focus 7
      shift + alt - 8 : yabai -m window --space 8; yabai -m space --focus 8
      shift + alt - 9 : yabai -m window --space 9; yabai -m space --focus 9

      shift + alt - space : yabai -m window --toggle float

      alt - n : open -na Safari
      # TODO: open private safari window, requires crazy applescript

      # TODO: basically enable/disable yabai
      # shift + alt - e : yabai -m space --toggle layout

      alt - f : yabai -m window --toggle zoom-fullscreen
      shift + alt - f : yabai -m window --toggle native-fullscreen
    '';
  };
}
