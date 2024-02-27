{
  lib,
  stdenv,
  fetchFromGitHub,
  darwin,
  cmake,
  clang,
  getconf,
  xcodebuild,
  fetchurl,
  fetchzip,
  runCommand,
}:
stdenv.mkDerivation rec {
  pname = "XMP-Toolkit-SDK";
  version = "2023.12";

  src = fetchFromGitHub {
    owner = "adobe";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-pRWhjmIVJgnSnm71xhXvtRQibjOFpyndsj0VYGBCuKc=";
  };

  # CMAKE_INSTALLED_XCODE_VERSION = "9.4.1";

  # nativeBuildInputs = let
  #   buildSymlinks = runCommand "xmp-toolkit-sdk-build-symlinks" {} ''
  #     mkdir -p $out/bin
  #     ln -s /usr/bin/xcrun /usr/bin/xcodebuild /usr/bin/clang $out/bin
  #   '';
  # in [
  #   buildSymlinks
  # ];

  buildInputs =
    [
      cmake
      getconf
      clang
      xcodebuild
    ]
    ++ lib.optional stdenv.isDarwin [
    ];

  postUnpack = let
    expat = fetchzip {
      url = "https://github.com/libexpat/libexpat/archive/refs/tags/R_2_6_0.zip";
      sha256 = "sha256-lgF5g0kC4+WGpJSg4GNr++HzQtjcInGDPsygRX6auxE=";
    };
    zlib = fetchTarball {
      url = "https://www.zlib.net/zlib-1.3.1.tar.gz";
      sha256 = "sha256:1xx5zcp66gfjsxrads0gkfk6wxif64x3i1k0czmqcif8bk43rik9";
    };
  in ''
    cp -r ${expat}/expat/lib $sourceRoot/third-party/expat
    cp -r ${zlib}/* $sourceRoot/third-party/zlib
  '';

  configurePhase = ''
    cd ./build
  '';

  prePatch = ''
    substituteInPlace ./build/shared/ToolchainLLVM.cmake \
        --replace "xcrun -find clang" "clang" \
        --replace "xcrun -find clang++" "clang++"

    # TODO: why doesn't the regex work in the first place?
    substituteInPlace ./build/shared/SharedConfig_Common.cmake \
      --replace 'set(CMAKE_INSTALLED_XCODE_VERSION ''${CMAKE_MATCH_1} PARENT_SCOPE)' 'set(CMAKE_INSTALLED_XCODE_VERSION "9.4.1" PARENT_SCOPE)'
  '';

  # TODO: next issue is that there are intenral scripts calling incorrect comands

  # TODO: system xcode
  # https://github.com/NixOS/nixpkgs/blob/ad7cb7fbd51fc6b4f89b45d531335f1dc3422864/pkgs/applications/editors/vim/macvim.nix#L19
  buildPhase = let
    BITS = "64";
    BUILD_TYPE = "Static";
    CPP_LIB = "libcpp";
    TOOLCHAIN = "ToolchainLLVM.cmake";
  in ''
    ./cmake.command ${BITS} ${BUILD_TYPE} ${CPP_LIB} WarningAsError ${TOOLCHAIN}
    # cat ./xcode/static/universal/cmake_install.cmake
    # /usr/bin/xcodebuild \
    xcodebuild build \
      -jobs $NIX_BUILD_CORES \
      -configuration Release \
      -project ./xcode/static/universal/XMPToolkitSDK64.xcodeproj
      -arch ${stdenv.hostPlatform.darwinArch}
    ls ./xcode/static/universal
  '';

  meta = with lib; {
    description = "The XMP Toolkit allows you to integrate XMP functionality into your product or solution";
    homepage = "https://github.com/adobe/XMP-Toolkit-SDK";
    license = with licenses; [bsd3];
    maintainers = with maintainers; [ok-nick];
    platforms = lib.platforms.darwin;
  };
}
