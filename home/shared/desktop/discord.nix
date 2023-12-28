{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    lib.optionals pkgs.stdenv.isLinux [
      # discord-canary works much better on linux
      discord-canary
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      discord
    ];

  # Discord wants latest version
  # https://nixos.wiki/wiki/Discord
  xdg = {
    mimeApps.defaultApplications = lib.mkIf pkgs.stdenv.isLinux {
      "x-scheme-handler/discord" = ["discordcanary.desktop"];
    };

    configFile.discord = {
      target = "discord/settings.json";
      text = ''
        {
          "SKIP_HOST_UPDATE": true
        }
      '';
    };
  };
}
