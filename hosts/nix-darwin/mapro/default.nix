let
  # TODO: make module var
  name = "mapro";
in {
  imports = [
    ../../shared/nix.nix
    ../../shared/sops.nix

    ../shared/nix.nix
    ../shared/modules.nix
    ../shared/homebrew.nix
    ../shared/fish.nix
    ../shared/shell.nix
    ../shared/skhd.nix
    ../shared/yabai.nix
    ../shared/apps.nix

    ../shared/users/nicky.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  networking = {
    hostName = name;
    computerName = name;
  };
  system.defaults.smb.NetBIOSName = name;

  # security.pam.enableSudoTouchIdAuth = true;

  # TODO: map cmd + d to spotlight or alt+d
  # system.keyboard.enableKeyMapping = true;

  homebrew = {
    brews = [
      "mas"
    ];
    casks = [
      "firefox" # platform not supported in nixpkgs
      "microsoft-office" # not packaged in nixpkgs
    ];
    masApps = {
      Xcode = 497799835; # homebrew itself needs it
      Bitwarden = 1352778147; # for safari extension
    };
  };

  programs = {
    # zsh is default shell on macOS, so enable it for compatibility
    zsh.enable = true;
  };

  # home-manager, programs.zsh.enableCompletion
  environment.pathsToLink = ["/share/zsh"];

  # TODO: will there be conflicts?
  # environment.systemPackages = with pkgs; [coreutils];

  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;

      AppleInterfaceStyle = "Dark";

      NSDocumentSaveNewDocumentsToCloud = false;
    };
    ".GlobalPreferences" = {
      # disable mouse acceleration
      "com.apple.mouse.scaling" = -1.0;
    };
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        # prevent .DS_Store files from being created on network/usb drives
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      # "com.apple.Safari" = {
      # IncludeDevelopMenu = true;
      # };
    };
    loginwindow = {
      GuestEnabled = false;
    };
    menuExtraClock = {
      ShowSeconds = true;
    };
    finder = {
      # shows path bar at bottom of window
      ShowPathbar = true;

      # hide desktop icons
      CreateDesktop = false;

      # when searching, search current folder by default
      FXDefaultSearchScope = "SCcf";

      # column view by default
      FXPreferredViewStyle = "clmw";

      # resmoves that annoying file extension change warning
      FXEnableExtensionChangeWarning = false;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      show-recents = false;
    };
  };

  system.stateVersion = 4;
}
