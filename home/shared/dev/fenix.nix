{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
  ];
  home.packages = with pkgs; [
    fenix.complete.toolchain
    # inputs.fenix.packages.${pkgs.hostPlatform.system}.complete.completeToolchain
    # (fenix.complete.withComponents [
    #   "cargo"
    #   "clippy"
    #   "rust-src"
    #   "rustc"
    #   "rustfmt"
    # ])
  ];
}
