{outputs, ...}: let
  name = "good";
in {
  imports = [
    ../../shared/nix.nix
    ../../shared/home-manager.nix

    ../shared/nix.nix
    ../shared/modules.nix
    ../shared/system.nix
    ../shared/homebrew.nix
    ../shared/fish.nix
    ../shared/shell.nix
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
    import ../../../home/nicky/good.nix;

  homebrew = {
    brews = [
      "llvm" # used for stable clang path for c2pa-rs WASM dev
    ];
    casks = [
      "firefox" # platform not supported in nixpkgs
      "karabiner-elements" # not packaged in nixpkgs
      "google-chrome" # platform not supported in nixpkgs
      "docker" # platform not supported in nixpkgs
      "iina" # finder open with broken with nixpkgs
      "mac-mouse-fix"
      # "cleanshot"
      "bitwarden" # no access to app store
    ];
  };

  programs = {
    # zsh is default shell on macOS, so enable it for compatibility
    zsh.enable = true;
  };

  # home-manager, programs.zsh.enableCompletion
  environment.pathsToLink = ["/share/zsh"];

  system.stateVersion = 6;
}
