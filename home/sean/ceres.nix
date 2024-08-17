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

  # ceres overrides of programs/*
  programs.alacritty = {
    settings.font.size = lib.mkForce 10;
  };
  services.polybar.config."bar/main" = {
    font-0 = lib.mkForce "Fira Mono:size=11.0;2";
    font-1 = lib.mkForce "Fira Mono:weight=bold:size=11.0;2";
  };

}
