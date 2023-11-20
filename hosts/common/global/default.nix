{outputs, ...}: {
  imports =
    [
      ./nix.nix
      ./network.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    overlays = [];
    config.allowUnfree = true;
  };

  hardware.enableRedistributableFirmware = true;
}
