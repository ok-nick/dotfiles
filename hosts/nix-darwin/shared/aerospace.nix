{...}: {
  system.defaults = {
    # NOTE: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
    spaces.spans-displays = true;
    # NOTE: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
    dock.expose-group-by-app = true;
  };

  services.aerospace = {
    enable = true;
    settings = {
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      enable-normalization-flatten-containers = true;
      # fixes the weird toggle split
      # https://github.com/nikitabobko/AeroSpace/discussions/736
      enable-normalization-opposite-orientation-for-nested-containers = false;

      accordion-padding = 30;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      # TODO: https://github.com/LnL7/nix-darwin/pull/1168
      # on-window-detected = [
      #   {
      #     "if.app-id" = "com.apple.FaceTime";
      #     run = "layout floating";
      #   }
      # ];

      mode.main.binding = {
        # All possible keys:
        # - Letters.        a, b, c, ..., z
        # - Numbers.        0, 1, 2, ..., 9
        # - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
        # - F-keys.         f1, f2, ..., f20
        # - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
        #                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
        # - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
        #                   keypadMinus, keypadMultiply, keypadPlus
        # - Arrows.         left, down, up, right

        # All possible modifiers: cmd, alt, ctrl, shift

        # https://nikitabobko.github.io/AeroSpace/goodness#disable-hide-app
        cmd-h = [];
        cmd-alt-h = [];

        alt-v = "layout horizontal vertical";
        alt-slash = "layout tiles";
        alt-period = "layout accordion";

        alt-b = "balance-sizes";
        # NOTE: aerosapce stops listening to keys after it's disabled
        # alt-t = "enable toggle";

        alt-f = "fullscreen";
        alt-shift-f = "macos-native-fullscreen";
        alt-shift-space = "layout floating tiling";

        alt-h = "focus --boundaries all-monitors-outer-frame left";
        alt-j = "focus --boundaries all-monitors-outer-frame down";
        alt-k = "focus --boundaries all-monitors-outer-frame up";
        alt-l = "focus --boundaries all-monitors-outer-frame right";
        # NOTE: commented because I remap option->left/right to ctrl->left/right for the
        #       move left/right word. There is a .dict file I can change to do this but it
        #       only affects apps that use cocoa, which many don't. Ideally aerospace would
        #       allow me to rebind keys so I can do both, but I want weird behavior regardless
        # alt-left = "focus --boundaries all-monitors-outer-frame left";
        # alt-down = "focus --boundaries all-monitors-outer-frame down";
        # alt-up = "focus --boundaries all-monitors-outer-frame up";
        # alt-right = "focus --boundaries all-monitors-outer-frame right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        alt-shift-left = "move left";
        alt-shift-down = "move down";
        alt-shift-up = "move up";
        alt-shift-right = "move right";

        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        alt-1 = "summon-workspace 1";
        alt-2 = "summon-workspace 2";
        alt-3 = "summon-workspace 3";
        alt-4 = "summon-workspace 4";
        alt-5 = "summon-workspace 5";
        alt-6 = "summon-workspace 6";
        alt-7 = "summon-workspace 7";
        alt-8 = "summon-workspace 8";
        alt-9 = "summon-workspace 9";
        alt-0 = "summon-workspace 10";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 10";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-w = "mode service";
      };

      mode.service.binding = {
        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];
        alt-shift-left = ["join-with left" "mode main"];
        alt-shift-down = ["join-with down" "mode main"];
        alt-shift-up = ["join-with up" "mode main"];
        alt-shift-right = ["join-with right" "mode main"];
      };
    };
  };
}
