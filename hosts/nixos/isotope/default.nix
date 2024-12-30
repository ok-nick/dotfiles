{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../shared/nix.nix
    ../../shared/sops.nix

    ../shared/users/nicky.nix

    ../shared/nix.nix
    ../shared/modules.nix
    # ../shared/network.nix
  ];

  networking.hostName = "isotope";

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.networkmanager.enable = true;
  users.users.temp = {
    isNormalUser = true;
    description = "nick";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  hardware.enableRedistributableFirmware = true;
  services = {
    blueman.enable = true;
    dbus.packages = [pkgs.gcr]; # for `services.gpg-agent.pinentryFlavor`
  };

  hardware = {
    graphics = {
      enable = true;
      # enable32Bit = true;
    };
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  virtualisation.vmware.guest.enable = true;

  security = {
    polkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nix-your-shell
  ];

  programs = {
    # enables hyprland-specific services and packages
    hyprland.enable = true;
    # to use as login shell
    fish = {
      enable = true;
      # https://github.com/MercuryTechnologies/nix-your-shell#fish
      promptInit = ''
        if command -q nix-your-shell
          ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source
        end
      '';
    };
  };

  xdg.portal = {
    enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
