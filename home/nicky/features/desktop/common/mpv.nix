{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      hwdec = "auto";
      hwdec-codecs = "all";
      profile = "gpu-hq";
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
    };
  };

  xdg.mimeApps.defaultApplications = {
    "audio/*" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
}
