{
  pkgs,
  config,
  inputs,
  ...
}: let
  grimblast = inputs.hyprland-contrib.packages.${pkgs.hostPlatform.system}.grimblast;
in {
  home.packages = [
    grimblast
    pkgs.jaq
  ];

  home.sessionVariables = {
    GRIMBLAST_EDITOR = "swappy --file";
  };

  services.kanshi.systemdTarget = ""; # hyprland-session is too early and doesn't reload on config changes
  services.swayidle.systemdTarget = "hyprland-session.target";

  # TODO: https://github.com/fufexan/dotfiles/blob/84ab5026fcbd593433f32f4b5fd535165e1886b4/home/wayland/hyprland/config.nix#LL170C42-L170C48
  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.hostPlatform.system}.default;
    extraConfig = ''
      exec = kanshi
      exec = pkill waybar; waybar
      # exec-once = eww open bar
      exec-once = mako
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
      exec-once = swaybg -i ${config.wallpaper} --mode fill

      input {
          follow_mouse = 2
          float_switch_override_focus = 0
      }

      # TODO: configure in icarus.nix
      device:elan0406:00-04f3:30a6-touchpad {
         accel_profile = "flat"
         clickfinger_behavior = true
         disable_while_typing = true
         middle_button_emulation = false
         natural_scroll = true
      }

      general {
          gaps_in = 0
          gaps_out = 0
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          # col.active_border = rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg
          col.inactive_border = rgba(595959aa)
          bezier = linear, 0.0, 0.0, 1.0, 1.0
          animation = borderangle, 1, 100, linear, loop
          layout = dwindle
          no_focus_fallback = true
      }

      group {
        col.border_active = rgba(00e9b2ee) rgba(fd01e6ee) 45deg
        col.border_inactive = rgba(595959aa)
        bezier = linear, 0.0, 0.0, 1.0, 1.0
        animation = borderangle, 1, 100, linear, loop
        groupbar {
          gradients = false
          render_titles = false
          col.active = rgba(fd01e6ee)
          col.inactive = rgba(595959aa)
        }
      }

      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          mouse_move_enables_dpms = true
          animate_manual_resizes = true
          animate_mouse_windowdragging = true
          # enable_swallow = true
          vrr = 1
          key_press_enables_dpms = true
      }

      decoration {
          blur {
              size = 3
              passes = 3
          }
          col.shadow = 0x66000000
      }

      animations {
          enabled = true

          bezier = overshot, 0.05, 0.9, 0.1, 1.05
          bezier = smoothOut, 0.36, 0, 0.66, -0.56
          bezier = smoothIn, 0.25, 1, 0.5, 1

          animation = windows, 1, 3, overshot, slide
          animation = windowsOut, 1, 3, smoothOut, slide
          animation = windowsMove, 1, 3, default
          animation = border, 1, 3, default
          animation = fade, 1, 3, smoothIn
          animation = fadeDim, 1, 3, smoothIn
          animation = workspaces, 1, 3, default
      }

      dwindle {
          preserve_split = true
          force_split = 2
      }

      gestures {
          workspace_swipe = true
          workspace_swipe_forever = true
      }

      $mod = SUPER

      bind = $mod, Return, exec, ${config.terminal}
      bind = $mod SHIFT, Q, killactive,
      bind = $mod SHIFT, E, exit,
      bind = $mod SHIFT, Space, togglefloating,
      bind = $mod, D, exec, pkill rofi || ${pkgs.rofi-wayland}/bin/rofi -show drun
      bind = $mod, V, togglesplit, # dwindle
      bind = $mod, N, exec, ${pkgs.firefox}/bin/firefox
      bind = $mod, P, exec, ${pkgs.firefox}/bin/firefox --private-window
      bind = $mod, F, fullscreen, 1
      bind = $mod SHIFT, F, fullscreen
      bind = $mod, C, exec, hyprpicker --autocopy --render-inactive
      bind = CONTROL_ALT, L, exec, loginctl lock-session

      # TODO: create script to zoom in/out with mouse wheel
      bind = $mod, Z, exec, hyprctl keyword misc:cursor_zoom_factor 2
      bindr = $mod, Z, exec, hyprctl keyword misc:cursor_zoom_factor 1
      bind = $mod SHIFT, Z, exec, hyprctl keyword misc:cursor_zoom_factor 4
      bindr = $mod SHIFT, Z, exec, hyprctl keyword misc:cursor_zoom_factor 1

      $dim = decoration:dim_inactive
      bind = $mod, B, exec, hyprctl keyword $dim $(($(hyprctl getoption $dim -j | jaq -r '.int') ^ 1))

      bind = $mod SHIFT, S, exec, ${grimblast}/bin/grimblast edit area
      bind = $mod CONTROL_SHIFT, S, exec, ${grimblast}/bin/grimblast edit screen

      bind = $mod SHIFT, O, exec, wl-ocr

      bind = $mod, G, togglegroup,
      bind = $mod SHIFT, N, changegroupactive, f
      bind = $mod SHIFT, P, changegroupactive, b

      bind = $mod, left, movefocus, l
      bind = $mod, right, movefocus, r
      bind = $mod, up, movefocus, u
      bind = $mod, down, movefocus, d
      bind = $mod, H, movefocus, l
      bind = $mod, J, movefocus, d
      bind = $mod, K, movefocus, u
      bind = $mod, L, movefocus, r

      bind = $mod SHIFT, left, movewindow, l
      bind = $mod SHIFT, right, movewindow, r
      bind = $mod SHIFT, up, movewindow, u
      bind = $mod SHIFT, down, movewindow, d
      bind = $mod SHIFT, H, movewindow, l
      bind = $mod SHIFT, J, movewindow, d
      bind = $mod SHIFT, K, movewindow, u
      bind = $mod SHIFT, L, movewindow, r

      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      bind = $mod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mod SHIFT, 0, movetoworkspacesilent, 10

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      binde = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      binde = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      # TODO: if below certain value, set to 0
      binde = , XF86MonBrightnessDown, exec, brillo -U 5 -u 100000
      binde = , XF86MonBrightnessUp, exec, brillo -A 5 -u 100000

      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous
      bindl = , XF86AudioNext, exec, playerctl next

      windowrulev2=workspace special silent,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$
      windowrulev2=float,class:^(firefox)$,title:^(Picture-in-Picture)$
      windowrulev2=pin,class:^(firefox)$,title:^(Picture-in-Picture)$
      # windowrulev2=nofullscreenrequest,class:^(firefox)$,title:(.*Bitwarden.*)
      # windowrulev2=nomaximizerequest,class:^(firefox)$,title:(.*Bitwarden.*)
      # windowrulev2=float,class:^(firefox)$,title:^(Extension: (Bitwarden - Free Password Manager) - Bitwarden — Mozilla Firefox)$
      # TODO: temp fix for bitwarden, check hyprland discord
      windowrulev2=nomaximizerequest,class:^(firefox)$
      windowrulev2=float,class:^(.blueman-manager-wrapped)$
      windowrulev2=float,class:^(nm-connection-editor)$
      windowrulev2=float,class:^(pavucontrol)$
    '';
  };
}
