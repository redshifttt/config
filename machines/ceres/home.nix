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
  ];

  home = let
    customPackage = inputs.self.packages.x86_64-linux;
  in {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.11";

    packages = with pkgs; [
      fzf
      bat
      lsd
      firefox
      git
      cantarell-fonts
      mpv
      alacritty
      ripgrep
      feh
      zathura
      mullvad-vpn
      nil
      easyeffects
      bfs
      audacity
      liberation_ttf fira-mono fira
      newsboat
      xclip xsel
      pavucontrol
      spotify
      thunderbird
      chromium
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

  programs.fzf = {
    enable = true;
  };

  # ceres overrides of programs/*
  programs.alacritty = {
    settings.font.size = lib.mkForce 10;
  };
  services.polybar.config."bar/main" = {
    font-0 = lib.mkForce "Fira Mono:size=11.0;2";
    font-1 = lib.mkForce "Fira Mono:weight=bold:size=11.0;2";
  };

}
