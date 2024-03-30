{
  pkgs,
  lib,
  config,
  ...
}: let
  plist = let
    action_config = {
      "Action Type" = 0;
      "Hot Key: Standard" = {
        "Key Code" = 48;
        "Modifiers" = 1048576;
        "Visual Representation" = "⌘⇥";
      };
      "Orientation" = 1;
      "Sort Order" = 3;
      "Spaces" = true;
      "Tabs" = false;
    };
  in {
    "Action Configuration" = [action_config];
    "Action Configurations" = [action_config];
    "Icon Mode" = 2;
    "Item Height" = 37;
    "Panel Delay" = 138;
    "Show Search Field: Disabling Mask" = 1;
  };
in {
  # TODO: copied from my karabiner config
  home.activation.refreshWitch = let
    config_dir = "${config.home.homeDirectory}/Library/Application Support/Witch";
  in
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.coreutils}/bin/mkdir -p "${config_dir}"
      ${pkgs.coreutils}/bin/cat > "${config_dir}/Settings.plist" << EOF
      ${lib.generators.toPlist {} plist}
      EOF
      # TODO: refresh witch app
    '';
}
