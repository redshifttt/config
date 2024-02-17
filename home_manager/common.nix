{ pkgs, inputs, ... }:
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

  home = rec {
    username = "sean";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = let
      cliPrograms = with pkgs; [
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
        nix-search-cli
      ];
      guiPrograms = with pkgs; [
        virt-manager
        easyeffects
        ckan
        audacity
        pavucontrol
        thunderbird
        mangohud
        prismlauncher
        mullvad-browser
        spotify
        libqalculate
        bitwarden
        gparted
      ];
      fontPackages = with pkgs; [
        cantarell-fonts
        liberation_ttf
        terminus_font
        dejavu_fonts
      ];
      customPackages = with inputs.self.packages.x86_64-linux; [
        fantasque-sans-mono
      ];
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
