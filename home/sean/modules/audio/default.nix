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
    preset = "epic";
  };

  home.file.".config/easyeffects/output/epic.json" = {
    enable = true;
    text = builtins.readFile ./epic.json;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];
}
