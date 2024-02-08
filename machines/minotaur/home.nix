{ pkgs, inputs, lib, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./../../programs/neovim
    ./../../programs/i3
    ./../../programs/zsh
    ./../../programs/alacritty
    ./../../programs/xdg
    ./../../programs/gtk
    ./../../programs/zathura
    ./../../programs/mpv
    ./../../programs/picom
    ./../../programs/dunst
    ./../../programs/polybar
    ./../../programs/git
    ./../../programs/newsboat
    ./../../programs/x11
    ./../../programs/mpd
    ./../../programs/tmux
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

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];


  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;

  programs.firefox.enable = true;

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;

  accounts.email.accounts."num@privatevoid.net".primary = true;
  programs.neomutt = {
    enable = true;
    vimKeys = true;
    sidebar.enable = true;
    extraConfig = "";
  };
}
