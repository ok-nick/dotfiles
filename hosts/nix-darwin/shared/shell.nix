{
  lib,
  config,
  ...
}: {
  # nix-darwin doesn't change the shells so we do it here
  system.activationScripts.postActivation.text = ''
    echo "setting up users' shells..." >&2

    ${lib.concatMapStringsSep "\n" (user: ''
      dscl . create /Users/${user.name} UserShell "${user.shell}"
    '') (lib.attrValues config.users.users)}
  '';
}
