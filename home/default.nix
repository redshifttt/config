{ pkgs, inputs, config, ... }:
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
  ];

  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.05";

    packages = with pkgs; [
      fzf
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

  # nix = {
  #   optimise = {
  #     dates = [ "daily" ];
  #     automatic = true;
  #   };
  #   gc = {
  #     dates = "weekly";
  #     automatic = true;
  #   };
  # };
}
