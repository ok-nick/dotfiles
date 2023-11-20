{pkgs, ...}: let
  # https://github.com/fufexan/dotfiles/blob/84ab5026fcbd593433f32f4b5fd535165e1886b4/home/wayland/default.nix#L14
  wl-ocr = pkgs.writeShellScriptBin "wl-ocr" ''
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t ppm - | ${pkgs.tesseract}/bin/tesseract - - | ${pkgs.wl-clipboard}/bin/wl-copy
    ${pkgs.libnotify}/bin/libnotify "$(${pkgs.wl-clipboard}/bin/wl-paste)"
  '';
in {
  home.packages = [
    wl-ocr
  ];
}
