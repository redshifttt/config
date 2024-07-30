{ pkgs, lib, stdenv }:
let
  inherit (pkgs) writeShellApplication writeTextFile;
in
{
  scrot = writeShellApplication {
    name = "scrot"; # SCReenshOT

    runtimeInputs = [
      pkgs.slop pkgs.shotgun pkgs.xclip
    ];

    text = builtins.readFile ./scrot;
  };

  fts = writeTextFile {
    name = "fts"; # FileTypeS
    text = ''
      #!/usr/bin/env nix-shell
      #!nix-shell -i python -p "python311.withPackages (ps: [ ps.prettytable ])"
      #!nix-shell -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs/

      ${builtins.readFile ./fts.py}
    '';

    destination = "/bin/fts";
    executable = true;
  };
}
