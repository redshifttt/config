{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs) mullvad-vpn; # gui
  };
}
