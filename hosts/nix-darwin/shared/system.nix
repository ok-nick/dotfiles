{...}: {
  networking.wakeOnLan.enable = true;

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

      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;

      "com.apple.sound.beep.feedback" = 1;
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
    controlcenter = {
      BatteryShowPercentage = true;
      # Bluetooth = false;
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
      # FXPreferredViewStyle = "clmv";

      # resmoves that annoying file extension change warning
      FXEnableExtensionChangeWarning = false;

      # show all file extensions
      AppleShowAllExtensions = true;

      # show hidden files
      AppleShowAllFiles = true;

      # show home folder when first opened
      NewWindowTarget = "Home";

      # show full filepath in window title
      _FXShowPosixPathInTitle = true;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      show-recents = false;

      # disable hot corners
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
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
}
