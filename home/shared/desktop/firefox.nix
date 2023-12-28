{
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    # TODO configure top bar, extensions, etc.
    profiles.nicky = {
      isDefault = true;
      settings = {
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "media.ffmpeg.vaapi.enabled" = true;
        "gfx.webrender.all" = true;
        "webgl.force-enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.toolbars.bookmarks.visbility" = "never";
        "extensions.pocket.enabled" = false;
        "browser.download.autohideButton" = false;
        "browser.tabs.firefox-view" = false;
        "browser.compactmode.show" = true;
        "extensions.screenshots.disabled" = true;
        "findbar.modalHighlight" = true;
        # NOTE: https://www.reddit.com/r/firefox/comments/pyeu36/comment/heycgtd/?utm_source=share&utm_medium=web2x&context=3
        "mousewheel.default.delta_multiplier_y" = 100; # TODO: trackpad only, set to 50 for trackpad
        "mousewheel.default.delta_multiplier_x" = 100; # ^
      };
    };
  };

  home.packages = with pkgs;
    lib.mkIf pkgs.stdenv.isLinux [
      # https://support.mozilla.org/en-US/kb/speechd-setup?as=u&utm_source=inproduct
      speechd
    ];

  xdg.mimeApps.defaultApplications = lib.mkIf pkgs.stdenv.isLinux {
    "application/pdf" = "firefox.desktop";
    "text/html" = "firefox.desktop";
    "text/xml" = "firefox.desktop";
  };

  home.sessionVariables = lib.mkIf pkgs.stdenv.isLinux {
    # better trackpad scrolling
    MOZ_USE_XINPUT2 = 1;
  };
}
