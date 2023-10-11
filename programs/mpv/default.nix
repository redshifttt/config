{
  programs.mpv = {
    enable = true;
    bindings = {
      LEFT = "seek -10";
      RIGHT = "seek 10";
      UP = "playlist-prev";
      DOWN = "playlist-next";
      SPACE = "cycle pause";
      m = "cycle mute";
      "<" = "no-osd cycle video-rotate 90";
      ">" = "no-osd cycle video-rotate 90";
      "." = "show-progress";
    };
    config = {
      msg-module = true;
      msg-color = true;
      osd-font = "Noto Sans";
      osd-font-size = 15;
      osd-border-size = 2;
      osd-duration = 3500;
      user-agent = "Mozilla/5.0";
      hls-bitrate = "max";
      sub-font = "Source Sans Pro";
      sub-font-size = 36;
      sub-color = "1.0/1.0/1.0/1.0";
      sub-back-color = "0.0/0.0/0.0/0.50";
      sub-border-color = "0.0/0.0/0.0/0.0";
      sub-use-margins = true;
      sub-ass-force-margins = true;
      sub-fix-timing = false;
    };
  };
}
