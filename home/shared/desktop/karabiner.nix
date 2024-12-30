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
          # flip scroll direction on mouse
          {
            ignore = false;
            identifiers = {
              is_game_pad = false;
              is_keyboard = false;
              is_pointing_device = true;
              product_id = 183;
              vendor_id = 5426;
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
                      # the commented command has issues like opening a completely new safari instance (which can get annoying
                      # with the background apps), reopening all opened tabs again (duplicated), and is very slow
                      # shell_command = "/usr/bin/open -na /Applications/Safari.app";

                      # here we only call "make new document" if safari isn't already running, that way it doesn't open two windows on start
                      shell_command = "/usr/bin/osascript -e 'if application \"Safari\" is running then' -e 'tell application \"Safari\" to make new document' -e 'else' -e 'tell application \"Safari\" to activate' -e 'end if'";
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
            {
              description = "Scerenshot area";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "s";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      key_code = "4";
                      # add left_control to copy directly to clipboard
                      modifiers = ["left_command" "left_shift"];
                    }
                  ];
                }
              ];
            }
            {
              description = "Screenshot window (CleanShot X)";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "a";
                    modifiers = {
                      mandatory = ["${mod}" "left_shift"];
                    };
                  };
                  to = [
                    {
                      key_code = "6";
                      modifiers = ["left_command" "left_shift"];
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
              description = "mod-M to fn-3 to open mission control";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "m";
                    modifiers = {
                      mandatory = ["${mod}"];
                    };
                  };
                  to = [
                    {
                      apple_vendor_keyboard_key_code = "mission_control";
                      modifiers = ["fn"];
                    }
                  ];
                }
              ];
            }
            # {
            #   description = "Cmd-V to Cmd-Shift-Option-V, paste unformatted";
            #   manipulators = [
            #     {
            #       type = "basic";
            #       from = {
            #         key_code = "v";
            #         modifiers = {
            #           mandatory = ["left_command"];
            #         };
            #       };
            #       to = [
            #         {
            #           "key_code" = "v";
            #           modifiers = ["left_command" "left_option" "left_shift"];
            #         }
            #       ];
            #     }
            #   ];
            # }
            # {
            #   description = "Cmd-Shift-V to Cmd-V, paste formatted";
            #   manipulators = [
            #     {
            #       type = "basic";
            #       from = {
            #         key_code = "v";
            #         modifiers = {
            #           mandatory = ["left_command" "left_shift"];
            #         };
            #       };
            #       to = [
            #         {
            #           "key_code" = "v";
            #           modifiers = ["left_command"];
            #         }
            #       ];
            #     }
            #   ];
            # }
            {
              description = "move Safari window left";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "right_arrow";
                    modifiers = {
                      mandatory = ["left_option" "left_shift" "left_control"];
                    };
                  };
                  to = [
                    {
                      shell_command = ''
                        osascript -e 'tell application "Safari"
                            set currentTabIndex to index of current tab of front window
                            set totalTabs to count of tabs of front window
                            if currentTabIndex < totalTabs then
                                set nextTabIndex to currentTabIndex + 1
                                tell front window
                                    set currentTab to tab currentTabIndex
                                    set nextTab to tab nextTabIndex
                                    move nextTab to before currentTab
                                end tell
                            end if
                        end tell'
                      '';
                    }
                  ];
                }
              ];
            }
            {
              description = "move Safari window left";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "left_arrow";
                    modifiers = {
                      mandatory = ["left_option" "left_shift" "left_control"];
                    };
                  };
                  to = [
                    {
                      shell_command = ''
                        osascript -e 'tell application "Safari"
                            set currentTabIndex to index of current tab of front window
                            if currentTabIndex > 1 then
                                tell front window
                                    set currentTab to tab currentTabIndex
                                    set previousTab to tab (currentTabIndex - 1)
                                    move previousTab to after currentTab
                                end tell
                            end if
                        end tell'
                      '';
                    }
                  ];
                }
              ];
            }

            #     {
            #       # TODO: apple trackpads aren't currently supported with karabiner
            #       description = "change hide application to yabai move modifier option+button1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             pointing_button = "button1";
            #             modifiers = {
            #               mandatory = ["left_option"];
            #             };
            #           };
            #           to = [
            #             {
            #               pointing_button = "button1";
            #               modifiers = ["fn"];
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "change hide application to yabai resize modifier option+button2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             pointing_button = "button2";
            #             modifiers = {
            #               mandatory = ["left_option"];
            #             };
            #           };
            #           to = [
            #             {
            #               pointing_button = "button2";
            #               modifiers = ["fn"];
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus left 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "left_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus west || ${pkgs.yabai}/bin/yabai -m display --focus west";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus left 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "h";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus west || ${pkgs.yabai}/bin/yabai -m display --focus west";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus right 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "right_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus east || ${pkgs.yabai}/bin/yabai -m display --focus east";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus right 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "l";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus east || ${pkgs.yabai}/bin/yabai -m display --focus east";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus up 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "up_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus north || ${pkgs.yabai}/bin/yabai -m display --focus north";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus up 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "k";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus north || ${pkgs.yabai}/bin/yabai -m display --focus north";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus down 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "down_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus south || ${pkgs.yabai}/bin/yabai -m display --focus south";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus down 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "j";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --focus south || ${pkgs.yabai}/bin/yabai -m display --focus south";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move left 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "left_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp west";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move left 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "h";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp west";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move right 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "right_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp east";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move right 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "l";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp east";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move up 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "up_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp north";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move up 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "k";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp north";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move down 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "down_arrow";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp south";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move down 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "j";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --warp south";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai float";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "spacebar";
            #             modifiers = {
            #               mandatory = [
            #                 "${mod}"
            #                 "left_shift"
            #               ];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle float";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai maximize";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "f";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle zoom-fullscreen";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai fullscreen";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "f";
            #             modifiers = {
            #               mandatory = [
            #                 "${mod}"
            #                 "left_shift"
            #               ];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle native-fullscreen";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai toggle";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "t";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "\"[ \"bsp\" = \"bsp\" ] && ${pkgs.yabai}/bin/yabai -m space --layout float || ${pkgs.yabai}/bin/yabai -m space --layout bsp";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai toggle split";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "v";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --toggle split";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "1";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 1";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "2";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 2";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 3";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "3";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 3";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 4";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "4";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 4";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 5";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "5";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 5";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 6";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "6";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 6";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 7";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "7";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 7";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 8";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "8";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 8";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 9";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "9";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 9";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai focus space 0";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "0";
            #             modifiers = {
            #               mandatory = ["${mod}"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m space --focus 10";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 1";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "1";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 1";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 2";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "2";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 2";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 3";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "3";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 3";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 4";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "4";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 4";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 5";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "5";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 5";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 6";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "6";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 6";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 7";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "7";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 7";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 8";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "8";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 8";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 9";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "9";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 9";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #     {
            #       description = "yabai move window to space 0";
            #       manipulators = [
            #         {
            #           type = "basic";
            #           from = {
            #             key_code = "0";
            #             modifiers = {
            #               mandatory = ["${mod}" "left_shift"];
            #             };
            #           };
            #           to = [
            #             {
            #               shell_command = "${pkgs.yabai}/bin/yabai -m window --space 10";
            #             }
            #           ];
            #         }
            #       ];
            #     }
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
