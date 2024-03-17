{ lib, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./common.nix
    ./../packages/ksp
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;

  programs.firefox.enable = true;
}
