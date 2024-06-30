{ config, pkgs, ... }:

let
  home = config.home.homeDirectory;
  miscDir = "${home}/files/misc";
in
{
  xdg.userDirs = {
    enable = true;

    createDirectories = true;
    extraConfig.XDG_MISC_DIR = miscDir;
    publicShare = miscDir;
    templates = miscDir;
    desktop = miscDir;

    documents = "${home}/files/docs";
    download = "${home}/files/download";
    music = "${home}/files/music";
    pictures = "${home}/files/images";
    videos = "${home}/files/vids";
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";
}
