{ lib, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./common.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.firefox.enable = true;
}
