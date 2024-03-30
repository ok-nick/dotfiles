{
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.nix-daemon.enable = true;

  nixpkgs = {
    overlays = [];
    config.allowUnfree = true;
  };

  nix = {
    package = pkgs.nix;

    settings = {
      # https://github.com/NixOS/nix/issues/7273
      auto-optimise-store = false;
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      # dates = "weekly";
      interval = {
        Weekday = 7;
      };
      options = "--delete-old";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = ["nixpkgs=${inputs.nixpkgs.outPath}"];
  };
}
