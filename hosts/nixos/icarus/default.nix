{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    # inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    # NOTE: disables nvidia gpu completely (saving battery)
    # inputs.hardware.nixosModules.common-gpu-nvidia-disable
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd

    ./hardware-configuration.nix

    ../../shared/nix.nix
    ../../shared/sops.nix

    ../shared/users/nicky.nix

    ../shared/nix.nix
    ../shared/modules.nix
    ../shared/network.nix
    ../shared/razer.nix
    ../shared/cec.nix
    ../shared/printing.nix
    ../shared/pipewire.nix
    # ../shared/gnome.nix
  ];

  networking.hostName = "icarus";

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  location.provider = "geoclue2";

  hardware.enableRedistributableFirmware = true;
  # hardware.nvidiaOptimus.disable = true; # disables nvidia card completely?

  # TODO: temp
  # users.users.jupyter.group = "jupyter";
  # users.groups.jupyter = {};

  # TODO: temporary for 220 pa4
  # systemd.coredump.enable = false;

  services = {
    # TODO: temp
    # jupyter = {
    # enable = true;
    # password = "'argon2:$argon2id$v=19$m=10240,t=10,p=8$RefST0aDghZuNSS7fO5vVA$YBJ0bVzBA5L8LTSjAXq/Yu/xsCw3M56oxEP+6+hGD4c'";
    # };
    # TODO: temp
    # postgresql = {
    # enable = false;
    # };
    # TODO: move to optional, needed for droidcam over usb
    usbmuxd.enable = true;
    # openssh = {
    #   enable = true;
    #   openFirewall = true;
    #   settings.PasswordAuthentication = true;
    # };
    #

    upower.enable = true;
    geoclue2.enable = true;
    blueman.enable = true;
    tlp.enable = false;
    dbus.packages = [pkgs.gcr]; # for `services.gpg-agent.pinentryFlavor`
    # disables mouse movement wake from suspend
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", ATTR{power/wakeup}="disabled", ATTR{driver/1-3.4.1/power/wakeup}="disabled"
    '';
    thermald.enable = true;
    hardware = {
      bolt.enable = true;
      # openrgb.enable = true;
    };
    fwupd.enable = true;
    logind = {
      extraConfig = ''
        HandlePowerKey=suspend
      '';
    };
    libinput = {
      enable = true;
      touchpad = {
        # TODO: sway shares the same config
        clickMethod = "clickfinger";
        accelProfile = "flat";
        accelSpeed = "0.5";
        disableWhileTyping = true;
        middleEmulation = false;
        naturalScrolling = true;
      };
    };
    xserver = {
      displayManager = {
        startx.enable = true;
        # defaultSession = "none+i3";
      };
      # TODO: enable from home-manager
      # windowManager = {
      #   i3 = {
      #     enable = true;
      #     extraPackages = with pkgs; [
      #       i3status
      #       i3lock
      #       i3blocks
      #     ];
      #   };
      # };
      # desktopManager = {
      #   xterm.enable = false;
      # };
    };
  };

  hardware = {
    nvidia = {
      # TODO: test open on/off
      open = true;
      prime = {
        offload.enable = true;
        # sync.enable = true;
        # reverseSync.enable = true;
      };
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    openrazer = {
      enable = false;
      users = ["nicky"];
    };
    system76.power-daemon.enable = true;
    keyboard.qmk.enable = true;
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    # to control backlight
    brillo.enable = true;
  };

  security = {
    polkit.enable = true;
    # https://github.com/NixOS/nixpkgs/issues/158025
    pam.services.swaylock = {};
  };

  environment.systemPackages = with pkgs; [
    nix-your-shell
  ];

  programs = {
    # enables hyprland-specific services and packages
    hyprland.enable = true;
    # TODO: temp
    droidcam.enable = true;
    # for gtk settings
    dconf.enable = true; # TODO: needed?
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

  # home-manager, programs.zsh.enableCompletion
  environment.pathsToLink = ["/share/zsh"];

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      # inputs.xdg-desktop-portal-hyprland.packages.${pkgs.hostPlatform.system}.default
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      # libsForQt5.xdg-desktop-portal-kde
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
