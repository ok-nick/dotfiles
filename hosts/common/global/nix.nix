{
  pkgs,
  inputs,
  lib,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-old";
    };
    optimise = {
      automatic = true;
      dates = ["weekly"];
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = ["nixpkgs=${inputs.nixpkgs.outPath}"];
  };

  boot.loader = let
    keepGenerations = 100;
  in {
    systemd-boot.configurationLimit = keepGenerations;
    grub.configurationLimit = keepGenerations;
  };
}
