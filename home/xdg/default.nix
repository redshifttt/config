{
  config,
  pkgs,
  lib,
  ...
}: {
  # A tidy home is a happy mind -- something like that.
  xdg.userDirs = rec {
    enable = true;

    createDirectories = true;
    extraConfig = {XDG_MISC_DIR = "${config.home.homeDirectory}/misc";};
    publicShare = extraConfig.XDG_MISC_DIR;
    templates = extraConfig.XDG_MISC_DIR;
    desktop = extraConfig.XDG_MISC_DIR;

    documents = "${config.home.homeDirectory}/files/docs";
    download = "${config.home.homeDirectory}/files/download";
    music = "${config.home.homeDirectory}/files/music";
    pictures = "${config.home.homeDirectory}/files/images";
    videos = "${config.home.homeDirectory}/files/vids";
  };
}
