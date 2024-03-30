{pkgs, ...}: {
  linearmouse = pkgs.callPackage ./linearmouse.nix {};
  c2patool = pkgs.callPackage ./c2patool {};
  xmp-toolkit-sdk = pkgs.callPackage ./xmp-toolkit-sdk.nix {};
}
