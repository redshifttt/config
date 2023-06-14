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
      transmission-gtk
      mullvad-vpn
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
    ./home/picom
  ];
}
