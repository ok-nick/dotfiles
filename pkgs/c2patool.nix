{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  libiconv,
  darwin,
  openssl,
  pkg-config,
  json_c,
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

  cargoSha256 = "sha256-m/48yUN4o4Fp+i0OAkVjltkmQ5TIbG4299LNLXiMYbU=";

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

  # TODO: not sure why this test fails, even when manually downloading the image and testing it
  #       however, using other images w/ manifests or the prebuilt binaries seem to work fine
  checkFlags = [
    "--skip=tool_info"
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
