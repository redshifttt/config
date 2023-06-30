{
  config,
    pkgs,
    lib,
    inputs,
    ...
}: {
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

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
      easyeffects
      nil
    ];
  };

  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./i3
    ./bash
    ./alacritty
    ./xdg
    ./gtk
    ./feh
    ./zathura
    ./mpv
    ./picom
    ./dunst
  ];

  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;

    dotDir = ".config/zsh";
  };
}
