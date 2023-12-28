{
  pkgs,
  lib,
  config,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      nix-your-shell
    ];
    shells = [pkgs.fish];
  };

  programs.fish = {
    enable = true;
    # https://github.com/LnL7/nix-darwin/pull/647#issuecomment-1628359005
    useBabelfish = true;
    # https://github.com/MercuryTechnologies/nix-your-shell#fish
    promptInit = ''
      if command -q nix-your-shell
        ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source
      end
    '';
    # https://github.com/LnL7/nix-darwin/issues/122#issuecomment-1659465635
    loginShellInit = let
      dquote = str: "\"" + str + "\"";

      makeBinPathList = map (path: path + "/bin");
    in ''
      fish_add_path --move --prepend --path ${lib.concatMapStringsSep " " dquote (makeBinPathList config.environment.profiles)}
      set fish_user_paths $fish_user_paths
    '';
  };
}
