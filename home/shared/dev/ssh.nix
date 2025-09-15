{
  pkgs,
  lib,
  ...
}: {
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  programs.ssh = {
    enable = true;
    # Added due to warning that it will be removed in the future.
    enableDefaultConfig = false;
    # addKeysToAgent = "yes";
    matchBlocks = {
      "github.com-ok-nick" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";

        extraOptions = {
          UseKeychain = lib.mkIf pkgs.stdenv.isDarwin "yes";
        };
      };
    };
  };
}
