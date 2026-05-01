{
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    # TODO configure top bar, extensions, etc.
    policies = {
      DisableFormHistory = true;
      DNSOverHTTPS = {
        Enabled = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        "{54fa1e34-a0ad-4526-a81b-b06139adf332}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duplicate_tab/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
      };
      Preferences = {
        "browser.tabs.insertAfterCurrent" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "media.ffmpeg.vaapi.enabled" = true;
        "gfx.webrender.all" = true;
        "webgl.force-enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "extensions.pocket.enabled" = false;
        "browser.download.autohideButton" = false;
        "browser.tabs.firefox-view" = false;
        "browser.compactmode.show" = true;
        "extensions.screenshots.disabled" = true;
        "findbar.modalHighlight" = true;
        "browser.uidensity" = 1;
        "browser.warnOnQuit" = true;
        "browser.ml.linkPreview.enabled" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.quicksuggest" = false;
        "signon.rememberSignons" = false;

        # Keep the https:// shown in URLs and selected when editing.
        "browser.urlbar.trimURLs" = false;

        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        "browser.formfill.enable" = false;

        # "Max Protection" DNS over HTTPS
        "network.trr.mode" = 3;

        # Allow pasting in dev console.
        "devtools.selfxss.count" = 100;

        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "browser.ping-centre.telemetry" = false;

        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

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
