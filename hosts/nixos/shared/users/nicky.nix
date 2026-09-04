{pkgs, ...}: let
  username = "nicky";
in {
  # nix.settings.trusted-users = ["nicky"];

  users = {
    mutableUsers = false;
    users = {
      ${username} = {
        initialPassword = "1234";
        isNormalUser = true;
        home = "/home/${username}";
        shell = pkgs.fish;
        extraGroups = [
          "wheel"
          "audio"
          "input"
          "video"
          "networkmanager" # permission to change network settings
          "adm" # forget?
          # "plugdev" # forget?
          "dialout" # cec device
        ];
      };
    };
  };
}
