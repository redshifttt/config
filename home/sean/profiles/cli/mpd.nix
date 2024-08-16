{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/sean/files/music/Organized and Tagged Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    settings = {
      song_list_format = "%n. %t$R%l";
      song_library_format = "%n. %t$R%l";
    };
  };
}
