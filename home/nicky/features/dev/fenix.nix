{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.fenix.packages.${pkgs.hostPlatform.system}.stable.completeToolchain
  ];
}
