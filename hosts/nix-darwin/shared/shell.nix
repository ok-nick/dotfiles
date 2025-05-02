{
  lib,
  config,
  pkgs,
  ...
}: {
  # nix-darwin doesn't change the shells so we do it here
  # dscl . create /Users/${user.name} UserShell "${user.shell}"
  system.activationScripts.postActivation.text = ''
    echo "setting up users' shells..." >&2

    ${lib.concatMapStringsSep "\n" (user: ''
      dscl . create /Users/${user.name} UserShell "${pkgs.fish}/bin/fish"
    '') (lib.attrValues config.users.users)}
  '';
}
