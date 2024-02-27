{
  pkgs,
  inputs,
  ...
}: {
  # nixpkgs.overlays = [
  #   inputs.fenix.overlays.default
  # ];
  home.packages = with pkgs; [
    # inputs.fenix.packages.${pkgs.hostPlatform.system}.complete.completeToolchain
    # fenix.complete.toolchain
    # fenix.targets.x86_64-pc-windows-msvc.latest.rust-std
    # (fenix.complete.withComponents [
    #   "cargo"
    #   "clippy"
    #   "rust-src"
    #   "miri"
    #   "rustc"
    #   "rustfmt"
    #   "rust-analyzer"
    # ])

    # too many problems w/ fenix and it's easier to switch around quickly with rustup
    rustup
  ];
}
