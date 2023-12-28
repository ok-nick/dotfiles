{lib, ...}: {
  options.terminal = lib.mkOption {
    type = lib.types.path;
    default = "";
    description = ''
      Terminal path
    '';
  };

  options.wallpaper = lib.mkOption {
    type = lib.types.path;
    default = "";
    description = ''
      Wallpaper path
    '';
  };
}
