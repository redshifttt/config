{ pkgs, lib, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      pavucontrol
      spotify
    ;
  };
}
