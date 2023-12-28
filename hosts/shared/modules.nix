{outputs, ...}: {
  imports = builtins.attrValues outputs.nixosModules;

  nixpkgs = {
    overlays = [];
    config.allowUnfree = true;
  };
}
