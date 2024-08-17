{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      ckan
      prismlauncher
    ;
  };
}
