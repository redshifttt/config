{ pkgs, lib, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      audacity
      pavucontrol
      spotify
    ;
  };

  services.easyeffects = {
    enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];
}
