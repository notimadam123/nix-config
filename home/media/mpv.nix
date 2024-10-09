{
  pkgs,
  config,
  ...
}: {
  programs.mpv = {
    enable = true;
    config = {
      sub-auto = "fuzzy";

      hwdec = "auto-safe";
      vo = "gpu-next";
      profile = "highspec";
      gpu-context = "wayland";
    };
  };
}
