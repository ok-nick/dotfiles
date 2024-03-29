{
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    # theme = "gruvbox-dark-hard";
    theme = "nord";
    terminal = config.terminal;
    # plugins = [
    #   pkgs.rofi-calc
    #   pkgs.rofi-bluetooth
    #   # https://github.com/P3rf/rofi-network-manager
    #   # https://github.com/fogine/rofi-search
    # ];
    extraConfig = {
      modi = "drun";
      show-icons = true;
      click-to-exit = true;
      display-drun = "APPLICATIONS";
    };
  };

  # TODO: use theme config from home-manager
  # https://github.com/flame-0/rice
  xdg.configFile."rofi/themes/nord.rasi".text = ''
    * {
      nord00: #2e3440;
      nord01: #3b4252;
      nord02: #434c5e;
      nord03: #4c566a;

      nord04: #d8dee9;
      nord05: #e5e9f0;
      nord06: #eceff4;

      nord07: #8fbcbb;
      nord08: #88c0d0;
      nord09: #81a1c1;
      nord10: #5e81ac;

      nord11: #bf616a;
      nord12: #d08770;
      nord13: #ebcb8b;
      nord14: #a3be8c;
      nord15: #b48ead;

      nord06-50: #eceff480;

      background-color: transparent;
      font: "JetBrains Mono Medium 10";
      spacing: 0px;
    }

    window {
        background-color: @nord00;
        border-color: @nord01;
        border-radius: 6px;
        border: 2px;
        location: center;
        width: 516px;
    }

    inputbar {
        padding: 7px;
        spacing: 7px;
    }

    prompt {
        background-color: @nord08;
        border-radius: 4px;
        font: "JetBrains Mono Medium 8";
        margin: -1px -1px -1px -1px;
        padding: 3px 6px 2px 6px;
        text-color: @nord03;
    }

    entry {
        color: @nord06-50;
        cursor: text;
        padding: 0px 0px 0px -1px;
        placeholder: "search applications";
    }

    listview {
        columns: 1;
        fixed-height: false;
        lines: 10;
        require-input: false;
    }

    element {
        padding: 7px;
    }

    element selected {
        background-color: @nord03;
    }

    element-icon {
        size: 16px;
    }

    element-text {
        highlight: bold;
        padding: 0px 0px 0px 8px;
        text-color: @nord06;
    }
  '';
}
