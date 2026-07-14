{ pkgs, lib, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      pavucontrol
      spotify
    ;
  };

  services.easyeffects = {
    enable = true;
    preset = "epic";
  };

  home.file.".local/share/easyeffects/output/epic.json" = {
    enable = true;
    source = ./epic.json;
  };
}
