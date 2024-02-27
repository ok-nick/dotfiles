{
  lib,
  stdenv,
  fetchFromGitHub,
  darwin,
  cmake,
  clang,
  getconf,
  expat,
  zlib,
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

  buildInputs = [
    clang
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.Carbon
    darwin.apple_sdk.frameworks.Security
  ];

  postUnpack = let
    # TODO: convert to fetchFromGitHub?
    expat = fetchzip {
      url = "https://github.com/libexpat/libexpat/archive/refs/tags/R_2_6_0.zip";
      sha256 = "sha256-lgF5g0kC4+WGpJSg4GNr++HzQtjcInGDPsygRX6auxE=";
    };
    zlib = fetchTarball {
      url = "https://www.zlib.net/zlib-1.3.1.tar.gz";
      sha256 = "sha256:1xx5zcp66gfjsxrads0gkfk6wxif64x3i1k0czmqcif8bk43rik9";
    };
    xmp-toolkit-rs = fetchFromGitHub {
      owner = "adobe";
      repo = "xmp-toolkit-rs";
      rev = "v1.7.0";
      sha256 = "sha256-s9z8uRBZ/tnQkvaTGhD7sP1hNln8duO8ltTx0AkOPN4=";
    };
  in ''
    cp -r ${expat}/expat/lib $sourceRoot/third-party/expat
    cp -r ${zlib}/* $sourceRoot/third-party/zlib

    cp -r ${xmp-toolkit-rs}/src/ffi.cpp $sourceRoot/ffi.cpp
  '';

  # TODO: use ${} for packages?
  buildPhase = ''
    # https://github.com/adobe/xmp-toolkit-rs/blob/63346d1257dd32bbe22d153bd3741b9ced0bd2f3/build.rs#L171
    # added -DXML_GE=1
    clang -c \
      -DHAVE_EXPAT_CONFIG_H=1 \
      -DNDEBUG \
      -DXML_DEV_URANDOM \
      -DXML_GE=1 \
      -Wno-enum-conversion \
      -Wno-missing-field-initializers \
      -Wno-unused-parameter \
      -IXMPCore/resource/mac \
      -IXMPFiles/resource/mac \
      third-party/expat/lib/xmlparse.c \
      third-party/expat/lib/xmlrole.c \
      third-party/expat/lib/xmltok.c

    # https://github.com/adobe/xmp-toolkit-rs/blob/63346d1257dd32bbe22d153bd3741b9ced0bd2f3/build.rs#L98
    # added -Wno-register & -framework CoreServices
    clang++ -c \
      -std=c++17 \
      -framework CoreServices \
      -DTXMP_STRING_TYPE=std::string \
      -DXML_STATIC=1 \
      -DXMP_StaticBuild=1 \
      -DHAVE_EXPAT_CONFIG_H=1 \
      -DMAC_ENV=1 \
      -DXMP_MacBuild=1 \
      -D_LARGEFILE64_SOURCE \
      -DXML_DEV_URANDOM \
      -DXMP_OSX_SDK=13.1 \
      -DXMP_OSX_TARGET=10.15 \
      -DAPPLE_UNIVERSAL=1 \
      -Wno-register \
      -Wno-bitwise-instead-of-logical \
      -Wno-deprecated-declarations \
      -Wno-deprecated-register \
      -Wno-int-in-bool-context \
      -Wno-macro-redefined \
      -Wno-null-conversion \
      -Wno-unused-but-set-variable \
      -Wno-deprecated \
      -Wno-missing-field-initializers \
      -Wno-reorder \
      -Wno-unused-function \
      -Wno-unused-parameter \
      -Wno-unused-variable \
      -Wnon-virtual-dtor \
      -Woverloaded-virtual \
      -IXMPCore/resource/mac \
      -IXMPFiles/resource/mac \
      -I. \
      -Ibuild \
      -Ipublic/include \
      -IXMPFilesPlugins/api/source \
      source/Host_IO-POSIX.cpp \
      XMPFiles/source/PluginHandler/OS_Utils_Mac.cpp \
      source/IOUtils.cpp \
      source/PerfUtils.cpp \
      source/UnicodeConversions.cpp \
      source/XIO.cpp \
      source/XML_Node.cpp \
      source/XMPFiles_IO.cpp \
      source/XMP_LibUtils.cpp \
      source/XMP_ProgressTracker.cpp \
      XMPCore/source/ExpatAdapter.cpp \
      XMPCore/source/ParseRDF.cpp \
      XMPCore/source/WXMPMeta.cpp \
      XMPCore/source/WXMPUtils.cpp \
      XMPCore/source/XMPCore_Impl.cpp \
      XMPCore/source/XMPIterator.cpp \
      XMPCore/source/WXMPIterator.cpp \
      XMPCore/source/XMPMeta.cpp \
      XMPCore/source/XMPMeta-GetSet.cpp \
      XMPCore/source/XMPMeta-Parse.cpp \
      XMPCore/source/XMPMeta-Serialize.cpp \
      XMPCore/source/XMPUtils.cpp \
      XMPCore/source/XMPUtils-FileInfo.cpp \
      XMPFiles/source/FileHandlers/AIFF_Handler.cpp \
      XMPFiles/source/FileHandlers/ASF_Handler.cpp \
      XMPFiles/source/FileHandlers/Basic_Handler.cpp \
      XMPFiles/source/FileHandlers/FLV_Handler.cpp \
      XMPFiles/source/FileHandlers/GIF_Handler.cpp \
      XMPFiles/source/FileHandlers/InDesign_Handler.cpp \
      XMPFiles/source/FileHandlers/JPEG_Handler.cpp \
      XMPFiles/source/FileHandlers/MP3_Handler.cpp \
      XMPFiles/source/FileHandlers/MPEG2_Handler.cpp \
      XMPFiles/source/FileHandlers/MPEG4_Handler.cpp \
      XMPFiles/source/FileHandlers/P2_Handler.cpp \
      XMPFiles/source/FileHandlers/PNG_Handler.cpp \
      XMPFiles/source/FileHandlers/PostScript_Handler.cpp \
      XMPFiles/source/FileHandlers/PSD_Handler.cpp \
      XMPFiles/source/FileHandlers/RIFF_Handler.cpp \
      XMPFiles/source/FileHandlers/Scanner_Handler.cpp \
      XMPFiles/source/FileHandlers/SonyHDV_Handler.cpp \
      XMPFiles/source/FileHandlers/SVG_Handler.cpp \
      XMPFiles/source/FileHandlers/SWF_Handler.cpp \
      XMPFiles/source/FileHandlers/TIFF_Handler.cpp \
      XMPFiles/source/FileHandlers/Trivial_Handler.cpp \
      XMPFiles/source/FileHandlers/UCF_Handler.cpp \
      XMPFiles/source/FileHandlers/WAVE_Handler.cpp \
      XMPFiles/source/FileHandlers/XDCAM_Handler.cpp \
      XMPFiles/source/FileHandlers/XDCAMEX_Handler.cpp \
      XMPFiles/source/FileHandlers/XDCAMFAM_Handler.cpp \
      XMPFiles/source/FileHandlers/XDCAMSAM_Handler.cpp \
      XMPFiles/source/FormatSupport/AIFF/AIFFBehavior.cpp \
      XMPFiles/source/FormatSupport/AIFF/AIFFMetadata.cpp \
      XMPFiles/source/FormatSupport/AIFF/AIFFReconcile.cpp \
      XMPFiles/source/FormatSupport/ASF_Support.cpp \
      XMPFiles/source/FormatSupport/ID3_Support.cpp \
      XMPFiles/source/FormatSupport/IFF/Chunk.cpp \
      XMPFiles/source/FormatSupport/IFF/ChunkController.cpp \
      XMPFiles/source/FormatSupport/IFF/ChunkPath.cpp \
      XMPFiles/source/FormatSupport/IFF/IChunkBehavior.cpp \
      XMPFiles/source/FormatSupport/IPTC_Support.cpp \
      XMPFiles/source/FormatSupport/ISOBaseMedia_Support.cpp \
      XMPFiles/source/FormatSupport/MOOV_Support.cpp \
      XMPFiles/source/FormatSupport/QuickTime_Support.cpp \
      XMPFiles/source/FormatSupport/PackageFormat_Support.cpp \
      XMPFiles/source/FormatSupport/P2_Support.cpp \
      XMPFiles/source/FormatSupport/PNG_Support.cpp \
      XMPFiles/source/FormatSupport/PostScript_Support.cpp \
      XMPFiles/source/FormatSupport/PSIR_FileWriter.cpp \
      XMPFiles/source/FormatSupport/PSIR_MemoryReader.cpp \
      XMPFiles/source/FormatSupport/ReconcileIPTC.cpp \
      XMPFiles/source/FormatSupport/ReconcileLegacy.cpp \
      XMPFiles/source/FormatSupport/ReconcileTIFF.cpp \
      XMPFiles/source/FormatSupport/Reconcile_Impl.cpp \
      XMPFiles/source/FormatSupport/RIFF.cpp \
      XMPFiles/source/FormatSupport/RIFF_Support.cpp \
      XMPFiles/source/FormatSupport/SVG_Adapter.cpp \
      XMPFiles/source/FormatSupport/SWF_Support.cpp \
      XMPFiles/source/FormatSupport/TIFF_FileWriter.cpp \
      XMPFiles/source/FormatSupport/TIFF_MemoryReader.cpp \
      XMPFiles/source/FormatSupport/TIFF_Support.cpp \
      XMPFiles/source/FormatSupport/TimeConversionUtils.cpp \
      XMPFiles/source/FormatSupport/XDCAM_Support.cpp \
      XMPFiles/source/FormatSupport/XMPScanner.cpp \
      XMPFiles/source/FormatSupport/WAVE/BEXTMetadata.cpp \
      XMPFiles/source/FormatSupport/WAVE/CartMetadata.cpp \
      XMPFiles/source/FormatSupport/WAVE/DISPMetadata.cpp \
      XMPFiles/source/FormatSupport/WAVE/INFOMetadata.cpp \
      XMPFiles/source/FormatSupport/WAVE/iXMLMetadata.cpp \
      XMPFiles/source/FormatSupport/WAVE/WAVEBehavior.cpp \
      XMPFiles/source/FormatSupport/WAVE/WAVEReconcile.cpp \
      XMPFiles/source/HandlerRegistry.cpp \
      XMPFiles/source/NativeMetadataSupport/IMetadata.cpp \
      XMPFiles/source/NativeMetadataSupport/MetadataSet.cpp \
      XMPFiles/source/NativeMetadataSupport/IReconcile.cpp \
      XMPFiles/source/PluginHandler/FileHandlerInstance.cpp \
      XMPFiles/source/PluginHandler/HostAPIImpl.cpp \
      XMPFiles/source/PluginHandler/Module.cpp \
      XMPFiles/source/PluginHandler/PluginManager.cpp \
      XMPFiles/source/PluginHandler/XMPAtoms.cpp \
      XMPFiles/source/WXMPFiles.cpp \
      XMPFiles/source/XMPFiles.cpp \
      XMPFiles/source/XMPFiles_Impl.cpp \
      third-party/zlib/adler32.c \
      third-party/zlib/compress.c \
      third-party/zlib/crc32.c \
      third-party/zlib/deflate.c \
      third-party/zlib/gzclose.c \
      third-party/zlib/gzlib.c \
      third-party/zlib/gzread.c \
      third-party/zlib/gzwrite.c \
      third-party/zlib/infback.c \
      third-party/zlib/inffast.c \
      third-party/zlib/inflate.c \
      third-party/zlib/inftrees.c \
      third-party/zlib/trees.c \
      third-party/zlib/uncompr.c \
      third-party/zlib/zutil.c \
      third-party/zuid/interfaces/MD5.cpp \
      ffi.cpp \
      xmlparse.o \
      xmlrole.o \
      xmltok.o \

      ar -rcs libxmp.a *.o
  '';

  installPhase = ''
    mkdir -p $out/lib
    mv libxmp.a $out/lib/
  '';

  meta = with lib; {
    description = "The XMP Toolkit allows you to integrate XMP functionality into your product or solution";
    homepage = "https://github.com/adobe/XMP-Toolkit-SDK";
    license = with licenses; [bsd3];
    maintainers = with maintainers; [ok-nick];
    platforms = lib.platforms.darwin;
  };
}
