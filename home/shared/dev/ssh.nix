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
      "*" = lib.mkIf pkgs.stdenv.isDarwin {
        extraOptions = {
          IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
        };
      };

      "github.com-ok-nick" = {
        hostname = "github.com";
        user = "git";

        extraOptions = {
          UseKeychain = lib.mkIf pkgs.stdenv.isDarwin "yes";
          # Avoid checking all keys on disk.
          IdentitiesOnly = "yes";
        };
      };
    };
  };
}
