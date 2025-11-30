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
    ../../shared/home-manager.nix
    ../../shared/sops.nix

    ../shared/nix.nix
    ../shared/modules.nix
    ../shared/system.nix
    ../shared/homebrew.nix
    ../shared/fish.nix
    ../shared/shell.nix
    # ../shared/skhd.nix
    # ../shared/jankyborders.nix
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

  home-manager.users.nicky =
    import ../../../home/nicky/mapro.nix;

  # TODO: other stuff:
  # * disable help improve spotlight
  # * disable show spotlight in menu bar
  # * use home-manager as a nixos/darwin module
  # * change spotlight open keybind to opt+d
  # * package and add config for aerospace-swipe
  # * cleanshotx config
  # * iina config
  # * fix setting fish shell as default (nix-darwin issue) need to set users.knownUsers and set the user.user.<name>.uid (hardcoded)
  # * mac mouse fix config
  # * remove safari home page stuff
  # * spotlight ignore list everything but applications
  # * mouse sensitivity
  # * package crates-lsp
  # * opt-d open app search

  # TODO: install mobileconfig https://github.com/paulmillr/encrypted-dns/blob/master/profiles/cloudflare-https.mobileconfig

  # security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    brews = [
      "mas"

      # "spim" # platform not supported in nixpkgs
      # "verible" # platform not supported in nixpkgs

      # "ns-3" # marked as broken in nixpkgs for darwin
      # "gforth" # broken in nixpkgs
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
      # "airmedia" # not packaged in nixpkgs
      # "spaceid" # not packaged in nixpkgs
      "docker-desktop" # platform not supported in nixpkgs
      "steam" # platform not supported in nixpkgs
      # "wireshark-chmodbpf" # not packaged in nixpkgs
      "wireshark-app" # broken on platform
      "obs" # platform not supported in nixpkgs
      # "squeak" # platform not supported in nixpkgs
      # "arduino-ide" # platform not supported in nixpkgs
      # "racket" # broken on platform
      # TODO: add iina plist config for:
      #       at launch: do nothing
      #       enable quit after all windows are closed
      #       disable playlist history and open recent
      #       disable play next item automatically
      #       resize the window to fit video size: disabled
      #       set iina as the default application
      "iina" # finder open with broken with nixpkgs
      "mac-mouse-fix"
      "cleanshot"
      "stremio"
      "discord" # not working with spotlight w/ home-manager
    ];
    masApps = {
      Xcode = 497799835; # homebrew itself needs it
      Bitwarden = 1352778147; # for safari extension
      # AdGuard = 1440147259; # for safari extension
      "uBlock Origin Lite" = 6745342698; # for safari extension

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

  system.stateVersion = 6;
}
