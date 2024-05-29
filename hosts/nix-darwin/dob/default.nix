{outputs, ...}: let
  name = "dob";
in {
  imports = [
    ../../shared/nix.nix

    ../shared/nix.nix
    ../shared/modules.nix
    ../shared/homebrew.nix
    ../shared/fish.nix
    ../shared/shell.nix
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

  nixpkgs.overlays = [
    outputs.overlays.additions
    outputs.overlays.modifications
  ];

  # security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    brews = [
      "mas"
    ];
    casks = [
      "firefox" # platform not supported in nixpkgs
      "karabiner-elements" # not packaged in nixpkgs
      "google-chrome" # platform not supported in nixpkgs
      "spaceid" # not packaged in nixpkgs
      "docker" # platform not supported in nixpkgs
    ];
    masApps = {
      # Xcode = 497799835; # homebrew itself needs it
      Bitwarden = 1352778147; # for safari extension
      AdGuard = 1440147259; # for safari extension
    };
  };

  programs = {
    # zsh is default shell on macOS, so enable it for compatibility
    zsh.enable = true;
  };

  # home-manager, programs.zsh.enableCompletion
  environment.pathsToLink = ["/share/zsh"];

  # TODO: share w/ mapro
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
      "com.apple.mouse.scaling" = -1.0;
    };
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };
    loginwindow = {
      GuestEnabled = false;
    };
    menuExtraClock = {
      ShowSeconds = true;
    };
    finder = {
      ShowPathbar = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "clmv";
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
