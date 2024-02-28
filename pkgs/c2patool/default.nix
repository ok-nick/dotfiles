{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  libiconv,
  darwin,
  openssl,
  pkg-config,
  git,
}:
rustPlatform.buildRustPackage rec {
  pname = "c2patool";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "contentauth";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-BmuNXIUHOmSdw+Fzk9CwlW9Piyh5iyddbqjqkzwcGnw=";
  };

  cargoHash = "sha256-xsZ+0sL8D3NURRYv967PaMATPxVyLBamDh0Ze5xjy4E=";

  # required for rust-openssl dependency to build
  OPENSSL_NO_VENDOR = 1;

  # work around https://github.com/NixOS/nixpkgs/issues/166205
  NIX_LDFLAGS = lib.optionalString (stdenv.cc.isClang && stdenv.cc.libcxx != null) " -l${stdenv.cc.libcxx.cxxabi.libName}";

  nativeBuildInputs = [
    git
    pkg-config
  ];
  buildInputs =
    [
      (lib.getDev openssl)
    ]
    ++ lib.optional stdenv.isDarwin [
      libiconv
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.Carbon
    ];

  cargoPatches = [
    # currently, there is an issue with older versions of the c2pa dependency, so we artificially update it here
    ./update-c2pa-rs.patch
  ];

  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/c2patool --version | grep "${version}"
  '';

  meta = with lib; {
    description = "Command line tool for displaying and adding C2PA manifests";
    homepage = "https://github.com/contentauth/c2patool";
    license = with licenses; [
      asl20
      /*
      or
      */
      mit
    ];
    maintainers = with maintainers; [ok-nick];
    mainProgram = "c2patool";
    platforms = lib.platforms.darwin;
  };
}
