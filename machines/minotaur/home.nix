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
    ./../../programs/feh
    ./../../programs/zathura
    ./../../programs/mpv
    ./../../programs/picom
    ./../../programs/dunst
    ./../../programs/polybar
    ./../../programs/git
    ./../../programs/newsboat
    ./../../programs/firefox
    ./../../programs/x11
  ];

  home = let
    customPackage = inputs.self.packages.x86_64-linux;
  in rec {
    username = "sean";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
      bat
      lsd
      cantarell-fonts
      ripgrep
      virt-manager
      nil
      easyeffects
      ckan
      bfs
      audacity
      liberation_ttf
      xclip
      xsel
      pavucontrol
      spotify
      playerctl
      thunderbird
      mangohud
      htop
      yt-dlp
      terminus_font
      monaspace
      prismlauncher
      pet
      jq
      bitwarden-cli
    ] ++ (with customPackage; [
      fantasque-sans-mono
      (discord.override { withOpenASAR = true; })
    ]);
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "spotify"
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;

  programs.tmux = {
    enable = true;

    mouse = false;
    clock24 = true;
    baseIndex = 1;
    historyLimit = 10000;

    extraConfig = ''
      set -g status-style 'bg=#333333 fg=#5eacd3'

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      '';
  };

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
