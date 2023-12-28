{
  xdg.configFile."waybar".source = ./waybar;

  programs.waybar = {
    enable = true;
    #     settings = [
    #       {
    #         modules-left = [
    #           # "custom/system76-power-graphics"
    #           # "custom/system76-power-profile"
    #           "network"
    #           # "wireplumber"
    #           "backlight"
    #         ];
    #         modules-center = [
    #           "sway/workspaces"
    #         ];
    #         modules-right = [
    #           "battery"
    #           # "cpu"
    #           # "memory"
    #           # "custom/gpu"
    #           "clock"
    #         ];
    #         clock = {
    #           "interval" = 1;
    #           "format" = "{:%d %b %H:%M:%S}";
    #         };
    #         cpu = {
    #           "interval" = 1;
    #           "format" = "CPU {avg_frequency:.2f},{usage:03}%";
    #         };
    #         memory = {
    #           "interval" = 1;
    #           "format" = "RAM {used:.2f},{percentage:03}%";
    #         };
    #         # TODO: doesn't work when I try setting :03 padding
    #         backlight = {
    #           "format" = "BKL {percent}%";
    #         };
    #         wireplumber = {
    #           "format" = "VOL {volume}%";
    #         };
    #         battery = {
    #           "interval" = 1;
    #           "format" = "BAT {power:04.1f},{capacity:03}%";
    #         };
    #         network = {
    #           "format" = "NET {essid}";
    #         };
    #         "custom/gpu" = {
    #           "interval" = 1;
    #           "exec" = "nvidia-smi --query-gpu utilization.gpu --format csv,noheader,nounits";
    #           "format" = "GPU {}%";
    #         };
    #         "custom/system76-power-graphics" = {
    #           "interval" = "once";
    #           "exec" = "system76-power graphics";
    #         };
    #         "custom/system76-power-profile" = {
    #           # TODO: update on systemd target?
    #           "interval" = "once";
    #           "exec" = "system76-power profile | rg '^Power Profile: ([^\n]+)' -r '$1' | awk '{print tolower($0)}'";
    #           # TODO: setup on-click toggle between perf and bat
    #         };
    #       }
    #     ];
    #     style = ''
    #       * {
    #           font-family: "IBM Plex Mono";
    #           font-size: 14px;
    #           margin: 0px 5px;
    #           color: #ffffff
    #       }
    #
    #       window {
    #           background: rgba(0, 0, 0, 0);
    #       }
    #     '';
  };
}
