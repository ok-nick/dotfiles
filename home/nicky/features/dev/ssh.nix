{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com-ok-nick" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "github.com-nmsalvem" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_nmsalvem";
      };
    };
  };
}
