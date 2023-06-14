{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.05";
    packages = with pkgs; [
      bash
      fzf
      fd
      bat
      lsd
      firefox
      git
      terminus_font
      cantarell-fonts
      mpv
      alacritty
      ripgrep
      feh
      zathura
      # neovim-nightly
      virt-manager
    ];
  };

  programs.home-manager.enable = true;

  # nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

  imports = [
    ./home/neovim
    ./home/i3
    ./home/bash
    ./home/alacritty
    ./home/xdg
    ./home/gtk
    ./home/feh
    ./home/zathura
    ./home/mpv
    ./home/dunst
  ];

  #services.picom = {
  #      enable = true;
  #      backend = "glx";
  #      fade = true;
  #      fadeSteps = [ 0.6 0.6 ];
  #      inactiveOpacity = 1;
  #      activeOpacity = 1;
  #      shadow = false;
  #      vSync = true;
  #      wintypes = {
  #      	tooltip = { fade = true; shadow = true; opacity = 1; focus = true; full-shadow = false; };
  #      	dock = { shadow = false; };
  #      	dnd = { shadow = false; };
  #      	popup_menu = { opacity = 1; };
  #      	dropdown_menu = { opacity = 1; };
  #      };
  #};
}