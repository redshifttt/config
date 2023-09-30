{ pkgs, inputs, lib, ... }:
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
      spotify
      playerctl
      thunderbird
      gzdoom
      mangohud
    ] ++ (with customPackage; [
      fantasque-sans-mono
      terminus_font_fancy
      (discord.override { withOpenASAR = true; })
    ]);
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

  programs.fzf = {
    enable = true;
  };
}
