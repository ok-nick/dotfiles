{
  pkgs,
  lib,
  config,
  ...
}: let
  mod = "left_option";
  json = {
    global = {
      check_for_updates_on_startup = false;
      show_in_menu_bar = false;
    };
    profiles = [
      {
        devices = [
          # flip scroll direction on mouse
          {
            ignore = false;
            identifiers = {
              is_game_pad = false;
              is_keyboard = false;
              is_pointing_device = true;
              product_id = 8226;
              vendor_id = 9610;
            };
            mouse_flip_vertical_wheel = true;
          }
          # flip scroll direction on mouse
          {
            ignore = false;
            identifiers = {
              is_game_pad = false;
              is_keyboard = false;
              is_pointing_device = true;
              product_id = 8209;
              vendor_id = 9610;
            };
            mouse_flip_vertical_wheel = true;
          }
        ];

        complex_modifications = {
          rules = [
            {
              description = "ctrl+left and ctrl+right to move left/right word";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "left_arrow";
                    modifiers = {
                      mandatory = ["left_control"];
                    };
                  };
                  to = [
                    {
                      key_code = "left_arrow";
                      modifiers = ["left_option"];
                    }
                  ];
                }
                {
                  type = "basic";
                  from = {
                    key_code = "right_arrow";
                    modifiers = {
                      mandatory = ["left_control"];
                    };
                  };
                  to = [
                    {
                      key_code = "right_arrow";
                      modifiers = ["left_option"];
                    }
                  ];
                }
              ];
            }
            {
              description = "ctrl+shift+left and ctrl+shift+right to select left/right word";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "left_arrow";
                    modifiers = {
                      mandatory = ["left_control" "left_shift"];
                    };
                  };
                  to = [
                    {
                      key_code = "left_arrow";
                      modifiers = ["left_option" "left_shift"];
                    }
                  ];
                }
                {
                  type = "basic";
                  from = {
                    key_code = "right_arrow";
                    modifiers = {
                      mandatory = ["left_control" "left_shift"];
                    };
                  };
                  to = [
                    {
                      key_code = "right_arrow";
                      modifiers = ["left_option" "left_shift"];
                    }
                  ];
                }
              ];
            }
            {
              description = "ctrl+backspace to delete previous word";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "delete_or_backspace";
                    modifiers = {
                      mandatory = ["left_control"];
                    };
                  };
                  to = [
                    {
                      key_code = "delete_or_backspace";
                      modifiers = ["left_option"];
                    }
                  ];
                }
              ];
            }
            {
              description = "open safari";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "n";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "/usr/bin/open -na /Applications/Safari.app";
                    }
                  ];
                }
              ];
            }
            {
              description = "open alacritty";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "return_or_enter";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      # TODO: for some reason yabai doesn't register the window when using ${pkgs.alacritty}/bin/alacritty
                      # shell_command = "/usr/bin/open -na /Applications/Alacritty.app";
                      shell_command = "/usr/bin/open -na ${config.home.profileDirectory}/applications/Alacritty.app";
                    }
                  ];
                }
              ];
            }
            {
              description = "OCR via Tesseract";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "o";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = let
                    img_path = "${config.home.homeDirectory}/Library/Caches/tesseract.png";
                  in [
                    {
                      shell_command = "screencapture -i ${img_path} && ${pkgs.tesseract}/bin/tesseract ${img_path} stdout | tr -d \\f | pbcopy
";
                    }
                  ];
                }
              ];
            }
            # {
            #   description = "disable hide application cmd+h";
            #   manipulators = [
            #     {
            #       type = "basic";
            #       from = {
            #         key_code = "h";
            #         modifiers = {
            #           mandatory = ["left_command"];
            #         };
            #       };
            #       to = [];
            #     }
            #   ];
            # }
            {
              description = "C-[ to ESC";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "open_bracket";
                    modifiers = {
                      mandatory = ["left_control"];
                    };
                  };
                  to = [
                    {
                      "key_code" = "escape";
                    }
                  ];
                }
              ];
            }

            {
              description = "change hide application to yabai move modifier option+button1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    pointing_button = "button1";
                    modifiers = {
                      mandatory = ["left_option"];
                    };
                  };
                  to = [
                    {
                      pointing_button = "button1";
                      modifiers = ["fn"];
                    }
                  ];
                }
              ];
            }
            {
              description = "change hide application to yabai resize modifier option+button2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    pointing_button = "button2";
                    modifiers = {
                      mandatory = ["left_option"];
                    };
                  };
                  to = [
                    {
                      pointing_button = "button2";
                      modifiers = ["fn"];
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus left 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "left_arrow";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus west || ${pkgs.yabai}/bin/yabai -m display --focus west";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus left 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "h";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus west || ${pkgs.yabai}/bin/yabai -m display --focus west";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus right 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "right_arrow";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus east || ${pkgs.yabai}/bin/yabai -m display --focus east";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus right 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "l";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus east || ${pkgs.yabai}/bin/yabai -m display --focus east";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus up 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "up_arrow";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus north || ${pkgs.yabai}/bin/yabai -m display --focus north";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus up 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "k";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus north || ${pkgs.yabai}/bin/yabai -m display --focus north";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus down 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "down_arrow";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus south || ${pkgs.yabai}/bin/yabai -m display --focus south";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai focus down 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "j";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --focus south || ${pkgs.yabai}/bin/yabai -m display --focus south";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move left 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "left_arrow";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp west";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move left 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "h";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp west";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move right 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "right_arrow";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp east";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move right 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "l";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp east";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move up 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "up_arrow";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp north";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move up 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "k";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp north";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move down 1";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "down_arrow";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp south";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai move down 2";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "j";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --warp south";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai float";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "spacebar";
                    modifiers = {
                      mandatory = [
                        "${mod}"
                        "left_shift"
                      ];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle float";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai maximize";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "f";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle zoom-fullscreen";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai fullscreen";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "f";
                    modifiers = {
                      mandatory = [
                        "${mod}"
                        "left_shift"
                      ];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle native-fullscreen";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai toggle";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "t";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "\"[ \"bsp\" = \"bsp\" ] && ${pkgs.yabai}/bin/yabai -m space --layout float || ${pkgs.yabai}/bin/yabai -m space --layout bsp";
                    }
                  ];
                }
              ];
            }
            {
              description = "yabai toggle split";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "v";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle split";
                    }
                  ];
                }
              ];
            }
          ];
        };
      }
    ];
  };
in {
  # TODO: can we use nix expression for /bin/ executables?
  # since there is no home manager module and I'm too lazy to create a derivation, this
  # will handle creating the config file
  # since karabiner is very flaky with symlinks we are creating the dir/file directly
  home.activation.refreshKarabiner = let
    config_dir = "${config.xdg.configHome}/karabiner";
  in
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.coreutils}/bin/mkdir -p ${config_dir}
      ${pkgs.coreutils}/bin/cat > ${config_dir}/karabiner.json << EOF
      ${builtins.toJSON json}
      EOF
    '';
}
