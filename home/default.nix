{ pkgs, inputs, lib, stdenv, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./i3
    ./zsh
    ./alacritty
    ./xdg
    ./gtk
    ./feh
    ./zathura
    ./mpv
    ./picom
    ./dunst
    ./polybar
    ./git
    ./newsboat
    ./firefox
  ];

  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.05";

    packages = with pkgs; [
      fzf
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
      virt-manager
      mullvad-vpn
      nil
      easyeffects
      ckan
      bfs
      audacity
      liberation_ttf
      fira-mono
      fira
      newsboat
      xclip
      xsel
      pavucontrol
      discord
      spotify
      playerctl

      (fantasque-sans-mono.overrideAttrs (final: prev: {
        pname = prev.pname + "-ss01";
        src = pkgs.fetchzip {
          url = "https://github.com/belluzj/fantasque-sans/releases/download/v${prev.version}/FantasqueSansMono-NoLoopK.zip";
          stripRoot = false;
          hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
        };
      }))
    ];
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "spotify"
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  services.syncthing.enable = true;
}
