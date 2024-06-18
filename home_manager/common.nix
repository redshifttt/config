{ pkgs, inputs, ... }:

let
  inherit (builtins) attrValues;

  username = "sean";
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./configs/neovim
    ./configs/i3
    ./configs/zsh
    ./configs/alacritty
    ./configs/xdg
    ./configs/gtk
    ./configs/zathura
    ./configs/mpv
    ./configs/picom
    ./configs/dunst
    ./configs/git
    ./configs/newsboat
    ./configs/x11
    ./configs/mpd
    ./configs/tmux
    ./configs/feh
  ];

  home = {
    inherit username homeDirectory;
    stateVersion = "23.11";

    packages = let
      cliPrograms = attrValues {
        inherit (pkgs)
          bat
          lsd
          ripgrep
          bfs
          nil
          htop
          yt-dlp
          pet
          jq
          mpc-cli
          file
          unzip
          nvd
          wget
          nix-search-cli;
      };
      guiPrograms = attrValues {
        inherit (pkgs)
          easyeffects
          ckan
          audacity
          pavucontrol
          thunderbird
          # mangohud
          prismlauncher
          spotify
          libqalculate
          bitwarden
          gparted
          librewolf;
      };
      fontPackages = attrValues {
        inherit (pkgs)
          cantarell-fonts
          liberation_ttf
          terminus_font
          dejavu_fonts
          open-sans;
      };
      customPackages = attrValues {
        inherit (inputs.self.packages.x86_64-linux)
          fantasque-sans-mono;
      };
    in []
      ++ cliPrograms
      ++ guiPrograms
      ++ fontPackages
      ++ customPackages;
  };

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
