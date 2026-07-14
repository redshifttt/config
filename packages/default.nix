{ pkgs, ... }:
{
  LS_COLORS = pkgs.callPackage ./ls_colors {};

  local-scripts = pkgs.callPackage ./local-scripts {};

  fts = pkgs.callPackage ./go-fts {};
}
