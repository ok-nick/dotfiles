{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./global

    # ./features/desktop/sway.nix
    ./features/desktop/hyprland.nix
    # ./features/desktop/wayfire.nix
    ./features/dev
    ./features/games
  ];

  wallpaper = "/persist/work/smiley.png";
  # wallpaper = "/home/nicky/Downloads/wallpaper.png"; # TODO: caues keyboard to not register with swaylock
  terminal = "${pkgs.alacritty}/bin/alacritty";

  # TODO: move this
  dconf.settings = {
    "org/blueman/plugins/powermanager" = {
      auto-power-on = false;
    };
  };

  # TODO: move this
  home.packages = with pkgs; [cachix element-desktop];

  # TODO: https://wiki.hyprland.org/Configuring/Multi-GPU/

  # TODO: base this off kanshi config
  # wayland.windowManager.sway.config.workspaceOutputAssign = {
  #   "1" = "Microstep MSI MPG27CQ 0x00000156";
  #   "2" = "Microstep MSI MPG27CQ 0x00000034";
  #   "3" = "VIZIO, Inc M422i-B1 0x00000101";
  # };

  # TODO: make a module for nvidia
  programs.mpv.config.hwdec = lib.mkForce "nvdec";

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    # extraConfig = ''
    #   workspace = name:1, default:true, monitor:Microstep MSI MPG27CQ 0x00000156
    #   workspace = name:2, default:true, monitor:Microstep MSI MPG27CQ 0x00000034
    #   workspace = name:3, default:true, monitor:VIZIO, Inc M422i-B1 0x01010101
    # '';
  };

  # TODO: I should be able to define my monitor config and it auto applies to autorandr or kanshi
  # https://gitlab.com/w0lff/shikane/-/tree/master/
  services.kanshi = {
    enable = true;
    profiles = {
      # TODO: I can't specify my vizio TV as monitor name beacuse of comma in it, it's a bug
      docked = {
        # TODO: set in sway settings
        # exec = [
        #   # first set the workspace to the display, then focus it, then change its current workspace
        #   # TODO: sway is starting before kanshi so this doesn't work
        #   ''
        #     "
        #     ${pkgs.sway}/bin/swaymsg 'workspace 3 output HDMI-A-1, focus output HDMI-A-1, workspace 3' \
        #     ${pkgs.sway}/bin/swaymsg 'workspace 2 output Microstep MSI MPG27CQ 0x00000034, focus output Microstep MSI MPG27CQ 0x00000034, workspace 2' \
        #     ${pkgs.sway}/bin/swaymsg 'workspace 1 output Microstep MSI MPG27CQ 0x00000156, focus output Microstep MSI MPG27CQ 0x00000156, workspace 1'
        #     "
        #   ''
        # ];
        outputs = [
          {
            criteria = "eDP-1";
            position = "0,2520";
            mode = "1920x1080@300.184998Hz";
            scale = 1.0;
            status = "disable";
          }
          {
            criteria = "Microstep MSI MPG27CQ 0x00000034";
            position = "0,1080";
            mode = "2560x1440@143.999";
            status = "enable";
          }
          {
            criteria = "Microstep MSI MPG27CQ 0x00000156";
            position = "2560,1080";
            mode = "2560x1440@143.999";
            status = "enable";
          }
          {
            criteria = "VIZIO, Inc M422i-B1 0x01010101";
            position = "1600,0";
            mode = "1920x1080@120.000000Hz";
            status = "enable";
          }
        ];
      };
      docked-optimus = {
        outputs = [
          {
            criteria = "Microstep MSI MPG27CQ 0x00000034";
            position = "0,1080";
            mode = "2560x1440@143.998993Hz";
            status = "enable";
          }
          {
            criteria = "Microstep MSI MPG27CQ 0x00000156";
            position = "2560,1080";
            mode = "2560x1440@143.998993Hz";
            status = "enable";
          }
          {
            criteria = "VIZIO, Inc M422i-B1 0x01010101";
            position = "1600,0";
            mode = "1920x1080@120.000000Hz";
            status = "enable";
          }
        ];
      };
      undocked = {
        # exec = [
        #   "${pkgs.sway}/bin/swaymsg 'workspace 1 output output AU Optronics 0xDE8E Unknown, focus output AU Optronics 0xDE8E Unknown, workspace 1'"
        # ];
        outputs = [
          {
            criteria = "AU Optronics 0xDE8E Unknown";
            position = "0,0";
            mode = "1920x1080@300.185Hz";
            # mode = "1920x1080@60.036Hz";
            # adaptiveSync = true;
            scale = 1.0;
            status = "enable";
          }
        ];
      };
      silverman = {
        # exec = [
        #   ''
        #     "
        #     ${pkgs.sway}/bin/swaymsg 'workspace 1 output output AU Optronics 0xDE8E Unknown, focus output AU Optronics 0xDE8E Unknown, workspace 1' \
        #     ${pkgs.sway}/bin/swaymsg 'workspace 2 output output HDMI-A-1, focus HDMI-A-1, workspace 2'
        #     "
        #   ''
        # ];
        outputs = [
          {
            criteria = "AU Optronics 0xDE8E Unknown";
            position = "0,0";
            mode = "1920x1080@300.185Hz";
            scale = 1.0;
            status = "enable";
          }
          {
            criteria = "HDMI-A-1"; # TODO: get id to TV
            position = "0,0";
            mode = "1920x1080@60.000Hz";
            status = "enable";
          }
        ];
      };
    };
  };

  home.sessionVariables = {
    # ONLY WORKS WITH OPTIMUS ENABLED
    # https://github.com/alacritty/alacritty/issues/6366#issuecomment-1517846249
    # TODO: set this on DC, set nvidia on AC
    __EGL_VENDOR_LIBRARY_FILENAMES = /run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json;
  };
}
