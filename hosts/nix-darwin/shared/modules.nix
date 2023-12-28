{outputs, ...}: {
  imports = builtins.attrValues outputs.nixDarwinModules;
}
