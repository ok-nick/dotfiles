{
  outputs,
  config,
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
    # ../shared/skhd.nix
    ../shared/jankyborders.nix
    # ../shared/yabai.nix
    ../shared/aerospace.nix
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

  # TODO: install mobileconfig https://github.com/paulmillr/encrypted-dns/blob/master/profiles/cloudflare-https.mobileconfig
  # TODO: move to file
  # networking = {
  #   knownNetworkServices = ["Wi-Fi" "USB 10/100/1000 LAN" "AX88179"];
  #   dns = ["1.1.1.1" "1.0.0.1"];
  # };

  # security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    brews = [
      "mas"

      # "spim" # platform not supported in nixpkgs
      # "verible" # platform not supported in nixpkgs

      # "ns-3" # marked as broken in nixpkgs for darwin
      "gforth" # broken in nixpkgs
    ];
    # taps = [
    # "chipsalliance/verible"
    # ];
    taps = builtins.attrNames config.nix-homebrew.taps;
    casks = [
      "firefox" # platform not supported in nixpkgs

      # TODO: to prevent microsoft-autoupdate from running do below (automate it)
      # sudo rm -rf /Library/Application\ Support/Microsoft/MAU2.0
      # sudo rm /Library/LaunchAgents/com.microsoft.update.agent.plist
      # sudo rm /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
      # "microsoft-office" # not packaged in nixpkgs

      "yubico-yubikey-manager" # platform not supported in nixpkgs
      "karabiner-elements" # not packaged in nixpkgs

      # "qtspim" # platform not supported in nixpkgs
      "google-chrome" # platform not supported in nixpkgs
      "figma" # not packged in nixpkgs
      "vmware-fusion" # not packaged in nixpkgs
      "airmedia" # not packaged in nixpkgs
      # "spaceid" # not packaged in nixpkgs
      "docker" # platform not supported in nixpkgs
      "steam" # platform not supported in nixpkgs
      # "wireshark-chmodbpf" # not packaged in nixpkgs
      "wireshark" # broken on platform
      "obs" # platform not supported in nixpkgs
      "squeak" # platform not supported in nixpkgs
      "arduino-ide" # platform not supported in nixpkgs
      "racket" # broken on platform
      # TODO: add iina plist config for:
      #       at launch: do nothing
      #       enable quit after all windows are closed
      #       disable playlist history and open recent
      #       disable play next item automatically
      #       resize the window to fit video size: disabled
      #       set iina as the default application
      "iina" # finder open with broken with nixpkgs
    ];
    masApps = {
      Xcode = 497799835; # homebrew itself needs it
      Bitwarden = 1352778147; # for safari extension
      AdGuard = 1440147259; # for safari extension

      # The brew-packaged one has annoying Microsoft auto-update program that always appears.
      "Microsoft Word" = 462054704;
      "Microsoft Outlook" = 985367838;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
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

  # TODO: for configuring spotlight search results
  # defaults write com.apple.Spotlight orderedItems -array ''
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 1; name = APPLICATIONS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = SYSTEM_PREFS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = MENU_SPOTLIGHT_SUGGESTIONS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 1; name = MENU_CONVERSION; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 1; name = MENU_EXPRESSION; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 1; name = MENU_DEFINITION; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = MENU_OTHER; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = DIRECTORIES; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = DOCUMENTS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = PRESENTATIONS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = SPREADSHEETS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = PDF; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = EVENT_TODO; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = BOOKMARKS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = CONTACT; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = MESSAGES; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = IMAGES; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = MOVIES; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = MUSIC; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = FONTS; }'
  # defaults write com.apple.Spotlight orderedItems -array-add '{ enabled = 0; name = SOURCE; }'

  # TODO: disable adding period on double space (and externel monitor auto off thing)
  # TODO: defaults write com.apple.Safari IncludeInternalDebugMenu 1 (allows to change tab ordering -> next to current and the other settings in the menu to apply it)
  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;

      AppleInterfaceStyle = "Dark";

      NSDocumentSaveNewDocumentsToCloud = false;
      # removs animations for better wm experience
      NSAutomaticWindowAnimationsEnabled = false;
      # drag window from anywhere (doesn't work in sequoia)
      # NSWindowShouldDragOnGesture = true;
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
      FXPreferredViewStyle = "clmv";

      # resmoves that annoying file extension change warning
      FXEnableExtensionChangeWarning = false;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      show-recents = false;
    };
    # "com.apple.Spotlight" = {
    #   orderedItems = [
    #     {
    #       name = "APPLICATIONS";
    #       enabled = true;
    #     }
    #     {
    #       name = "SYSTEM_PREFS";
    #       enabled = false;
    #     }
    #     {
    #       name = "MENU_SPOTLIGHT_SUGGESTIONS";
    #       enabled = false;
    #     }
    #     {
    #       name = "MENU_CONVERSION";
    #       enabled = true;
    #     }
    #     {
    #       name = "MENU_EXPRESSION";
    #       enabled = true;
    #     }
    #     {
    #       name = "MENU_DEFINITION";
    #       enabled = true;
    #     }
    #     {
    #       name = "MENU_OTHER";
    #       enabled = false;
    #     }
    #     {
    #       name = "DIRECTORIES";
    #       enabled = false;
    #     }
    #     {
    #       name = "DOCUMENTS";
    #       enabled = false;
    #     }
    #     {
    #       name = "PRESENTATIONS";
    #       enabled = false;
    #     }
    #     {
    #       name = "SPREADSHEETS";
    #       enabled = false;
    #     }
    #     {
    #       name = "PDF";
    #       enabled = false;
    #     }
    #     {
    #       name = "EVENT_TODO";
    #       enabled = false;
    #     }
    #     {
    #       name = "BOOKMARKS";
    #       enabled = false;
    #     }
    #     {
    #       name = "CONTACT";
    #       enabled = false;
    #     }
    #     {
    #       name = "MESSAGES";
    #       enabled = false;
    #     }
    #     {
    #       name = "IMAGES";
    #       enabled = false;
    #     }
    #     {
    #       name = "MOVIES";
    #       enabled = false;
    #     }
    #     {
    #       name = "MUSIC";
    #       enabled = false;
    #     }
    #     {
    #       name = "FONTS";
    #       enabled = false;
    #     }
    #     {
    #       name = "SOURCE";
    #       enabled = false;
    #     }
    #   ];
    # };
  };

  system.stateVersion = 4;
}
