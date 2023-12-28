{pkgs, ...}: {
  imports = [
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./eww.nix
    ./ocr.nix
    ./rofi.nix
    ./swappy.nix
  ];

  home.packages = with pkgs; [
    wl-mirror
    wl-clipboard
    wf-recorder
    swaybg
    slurp
    grim
    wlr-randr
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    # cliphist # TODO
    hyprpicker
    kanshi
    # wluma # https://github.com/maximbaz/wluma/issues/8
  ];

  # TODO: make a module for toggling wayland
  programs.mpv.config.gpu-context = "wayland"; # TODO: make another module for the vulkan setting (waylandvk)

  home.sessionVariables = {
    # firefox on wayland
    MOZ_ENABLE_WAYLAND = 1;
    # use wayland for QT apps
    QT_QPA_PLATFORM = "wayland";
    # use wayland for electron apps
    NIXOS_OZONE_WL = 1;
    # use vulkan
    # WLR_RENDERER = "vulkan";
    # https://wiki.archlinux.org/title/sway#No_visible_cursor
    WLR_NO_HARDWARE_CURSORS = 1;
  };
}
