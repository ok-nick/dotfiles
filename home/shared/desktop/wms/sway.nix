{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./common
    ./common/wayland
  ];

  wayland.windowManager = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = rec {
        menu = "pkill rofi || ${pkgs.rofi-wayland}/bin/rofi -show drun";

        modifier = "Mod4";

        left = "h";
        down = "j";
        up = "k";
        right = "l";

        focus.followMouse = false;

        colors = {
          focused = {
            border = "#FFFFFF";
            background = "#FFFFFF";
            text = "#000000";
            indicator = "#FFFFFF";
            childBorder = "#FFFFFF";
          };
        };

        bars = [
          {
            command = "${pkgs.waybar}/bin/waybar";
          }
        ];

        output = {
          # TODO: set path in top-level module
          "*".bg = "${config.wallpaper} fill";
        };

        input = {
          "type:touchpad" = {
            click_method = "clickfinger";
            accel_profile = "flat";
            pointer_accel = "0.5";
            dwt = "enabled";
            middle_emulation = "disabled";
            natural_scroll = "enabled";
          };
        };

        startup = [
          # notifications
          {command = "${pkgs.mako}/bin/mako";}
          # polkit authentication agent
          {command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";}
          # {command = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";}
        ];

        window.commands = [
          {
            command = "floating enable";
            criteria = {
              app_id = "org.kde.polkit-kde-authentication-agent-1";
            };
          }
        ];

        keybindings = let
          mod = modifier;
          browser = "${pkgs.firefox}/bin/firefox";
          privateBrowser = "${pkgs.firefox}/bin/firefox --private-window";
          inherit
            left
            down
            up
            right
            menu
            ;
        in {
          "${mod}+Return" = "exec ${config.terminal}";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec ${menu}";
          "${mod}+n" = "exec ${browser}";
          "${mod}+p" = "exec ${privateBrowser}";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+e" = "exec ${pkgs.sway}/bin/swaymsg exit";
          "${mod}+Shift+d" = "${pkgs.systemd}/bin/systemctl restart --user kanshi";

          "ctrl+alt+l" = "exec ${pkgs.swaylock}/bin/swaylock";

          "${mod}+${left}" = "focus left";
          "${mod}+${down}" = "focus down";
          "${mod}+${up}" = "focus up";
          "${mod}+${right}" = "focus right";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+${left}" = "move left";
          "${mod}+Shift+${down}" = "move down";
          "${mod}+Shift+${up}" = "move up";
          "${mod}+Shift+${right}" = "move right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+b" = "split h";
          "${mod}+v" = "split v";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+comma" = "layout stacking";
          "${mod}+period" = "layout tabbed";
          "${mod}+slash" = "layout toggle split";
          "${mod}+a" = "focus parent";
          "${mod}+s" = "focus child";

          "${mod}+minus" = "scratchpad show";
          "${mod}+Shift+minus" = "move container to scratchpad";

          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          "XF86MonBrightnessDown" = "exec brillo -U 5 -u 100000";
          "XF86MonBrightnessUp" = "exec brillo -A 5 -u 100000";
        };
      };
    };
  };
}
