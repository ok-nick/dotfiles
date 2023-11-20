{
  networking = {
    wireless = {
      userControlled.enable = false;
      iwd = {
        enable = false;
        settings = {
          Network = {
            EnableIPv6 = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
      networks = {
        eduroam = {
          # TODO: move files to secret manager and hide private_key_passwd
          auth = ''TODO'';
        };
      };
    };
    networkmanager = {
      enable = true;
      # logLevel = "INFO";
      ethernet.macAddress = "stable";
      # wifi.backend = "iwd";
    };
  };
}
