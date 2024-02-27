{
  pkgs,
  outputs,
  ...
}: let
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
    ../shared/karabiner.nix

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

  environment.systemPackages = with pkgs; [
    c2patool
  ];

  # security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    brews = [
      "mas"

      "spim" # platform not supported in nixpkgs
    ];
    casks = [
      "firefox" # platform not supported in nixpkgs
      # TODO: to prevent microsoft-autoupdate from running do below (automate it)
      # sudo rm -rf /Library/Application\ Support/Microsoft/MAU2.0
      # sudo rm /Library/LaunchAgents/com.microsoft.update.agent.plist
      # sudo rm /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
      "microsoft-office" # not packaged in nixpkgs
      "yubico-yubikey-manager" # platform not supported in nixpkgs
      "karabiner-elements" # not packaged in nixpkgs

      "qtspim" # platform not supported in nixpkgs
      "google-chrome" # platform not supported in nixpkgs
    ];
    masApps = {
      Xcode = 497799835; # homebrew itself needs it
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

  # TODO: will there be conflicts?
  # environment.systemPackages = with pkgs; [coreutils];

  # TODO: disable adding period on double space (and externel monitor auto off thing)
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
      #  TODO:
      # "com.apple.screensaver" = {
      #   askForPassword = 1;
      #   askForPasswordDelay = 0;
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
