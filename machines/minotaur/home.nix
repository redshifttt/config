{ pkgs, inputs, lib, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./../../programs/neovim
    ./../../programs/sway
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
    ./../../programs/firefox
    ./../../programs/x11
    ./../../programs/mpd
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
        bitwarden-cli
        slurp
        grim
        wl-clipboard
        imv
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
    in [] ++ cliPrograms ++ guiPrograms ++ fontPackages ++ customPackages;
  };

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
