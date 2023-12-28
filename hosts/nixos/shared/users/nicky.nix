{pkgs, ...}: {
  # nix.settings.trusted-users = ["nicky"];

  users = {
    mutableUsers = false;
    users = {
      nicky = {
        initalPassword = "1234";
        isNormalUser = true;
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
