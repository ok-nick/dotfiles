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
      version = "0.19.0-Beta";
      src = final.fetchzip {
        url = "https://github.com/nikitabobko/AeroSpace/releases/download/v${version}/AeroSpace-v${version}.zip";
        sha256 = "sha256-Sq9Y/g3pR/G4546PXX9ROOi+m6zSNkl9VEU0pY9ykEc=";
      };
    });
  };
}
