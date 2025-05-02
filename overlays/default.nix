{...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    # karabiner-elements = prev.karabiner-elements.overrideAttrs (_: rec {
    #   version = "14.13.0";
    #   src = final.fetchurl {
    #     url = "https://github.com/pqrs-org/Karabiner-Elements/releases/download/v${version}/Karabiner-Elements-${version}.dmg";
    #     sha256 = "sha256-gmJwoht/Tfm5qMecmq1N6PSAIfWOqsvuHU8VDJY8bLw=";
    #   };
    # });
    aerospace = prev.aerospace.overrideAttrs (_: rec {
      version = "0.18.4-Beta";
      src = final.fetchzip {
        url = "https://github.com/nikitabobko/AeroSpace/releases/download/v${version}/AeroSpace-v${version}.zip";
        sha256 = "sha256-TjVxq1HS/gdGi32noj7i1P6e9lXKNtBoO373Cesnwks=";
      };
    });
  };
}
