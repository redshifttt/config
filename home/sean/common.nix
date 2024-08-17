{ pkgs, inputs, ... }:

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
    nvd
    wget
    ffmpeg
    thunderbird;
    inherit (inputs.nil.packages.x86_64-linux) nil;
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
