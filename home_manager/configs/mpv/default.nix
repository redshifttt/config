{
  programs.mpv = {
    enable = true;
    bindings = {
      k = "seek -5";
      j = "seek 5";
      h = "playlist-prev";
      l = "playlist-next";
      m = "cycle mute";
      SPACE = "cycle pause";
      "." = "show-progress";
    };
    config = {
      msg-module = true;
      msg-color = true;
      msg-time = true;

      osd-font = "Cantarell";
      osd-font-size = 15;
      osd-border-size = 2;
      osd-duration = 3500;
      osd-bar-align-x = 0;
      osd-bar-align-y = 1;
      osd-bar-w = 100;
      osd-bar-h = 2;

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
