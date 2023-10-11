{ config, ... }:

let
  home = config.home.homeDirectory;
in
{
  # A tidy home is a happy mind -- something like that.
  xdg.userDirs = rec {
    enable = true;

    createDirectories = true;
    extraConfig = {
      XDG_MISC_DIR = "${home}/files/misc";
    };
    publicShare = extraConfig.XDG_MISC_DIR;
    templates = extraConfig.XDG_MISC_DIR;
    desktop = extraConfig.XDG_MISC_DIR;

    documents = "${home}/files/docs";
    download = "${home}/files/download";
    music = "${home}/files/music";
    pictures = "${home}/files/images";
    videos = "${home}/files/vids";
  };
}
