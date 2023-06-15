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
      librewolf
      git
      terminus_font
      cantarell-fonts
      mpv
      alacritty
      ripgrep
      feh
      zathura
      virt-manager
      transmission-gtk
      mullvad-vpn
      easyeffects
    ];
  };

  programs.home-manager.enable = true;

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
    ./home/picom
    ./home/dunst
  ];
}
