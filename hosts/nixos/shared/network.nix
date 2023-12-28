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
      };
    };
    networkmanager = {
      enable = true;
      # logLevel = "INFO";
      # TODO: enabling this will constantly change mac address of ethernet adapter
      # ethernet.macAddress = "stable";
      # wifi.backend = "iwd";
    };
  };
}
