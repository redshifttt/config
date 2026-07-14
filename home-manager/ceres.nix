{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./programs/cli
    ./programs/ghostty.nix
    ./programs/gui
    ./programs/audio
    ./programs/fonts.nix
    ./programs/gaming.nix
    ./programs/browsers.nix
    ./programs/vpn.nix
    ./programs/xdg.nix
  ];

  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.11";

    packages = builtins.attrValues {
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
      transmission_4-gtk
      mediainfo
      fastfetch
      tokei
      moor
      xkill;
    };
  };

  xdg.userDirs.setSessionVariables = true;

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
