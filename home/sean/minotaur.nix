{
  programs.home-manager.enable = true;

  imports = [
    ./common.nix

    ./modules/cli
    ./modules/gui
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/gaming.nix
    ./modules/browsers.nix
    ./modules/vpn.nix
    ./modules/xdg.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
