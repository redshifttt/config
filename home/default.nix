{ pkgs, inputs, ... }:
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
  ];

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
      mullvad-vpn
      nil
      fantasque-sans-mono
      easyeffects
    ];
  };

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      fantasque-sans-mono = pkgs.fantasque-sans-mono.overrideAttrs (finalAttrs: previousAttrs: {
        pname = previousAttrs.pname + "-ss01";
        src = pkgs.fetchzip {
          url = "https://github.com/belluzj/fantasque-sans/releases/download/v${previousAttrs.version}/FantasqueSansMono-NoLoopK.zip";
          stripRoot = false;
          hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
        };
      });
    };
  };
}
