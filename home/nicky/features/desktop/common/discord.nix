{pkgs, ...}: {
  home.packages = with pkgs; [
    discord-canary
  ];

  # Discord wants latest version
  # https://nixos.wiki/wiki/Discord
  xdg = {
    mimeApps.defaultApplications = {
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
