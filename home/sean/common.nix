{ pkgs, ... }:

let
  inherit (builtins) attrValues;

  genericPrograms = attrValues {
    inherit (pkgs)
    ripgrep
    bfs
    htop
    yt-dlp
    pet
    jq
    file
    unzip
    wget
    ffmpeg
    thunderbird
    transmission_3-gtk
    mediainfo
    fastfetch
    tokei
    moar;
    inherit (pkgs.xorg) xkill;
  };
in
{
  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.11";

    packages = genericPrograms;
  };

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
