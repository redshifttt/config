{ pkgs, lib, stdenv }:
let
  inherit (pkgs) writeShellApplication;
in
{
  scrot = writeShellApplication {
    name = "scrot"; # SCReenshOT

    runtimeInputs = [
      pkgs.slop pkgs.shotgun pkgs.xclip
    ];

    text = builtins.readFile ./scrot;
  };
}
