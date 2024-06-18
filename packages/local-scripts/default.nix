{ pkgs }:
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

  fcd = writeShellApplication {
    name = "fcd"; # fzf cd

    runtimeInputs = [ pkgs.bfs pkgs.fzf ];

    text = ''
      cd "$(bfs $HOME -type d -nocolor 2>/dev/null | fzf --height=40% --reverse)"
    '';
  };

  fts = writeShellApplication {
    name = "fts"; # FileTypeS

    runtimeInputs = [
      pkgs.python311
      pkgs.python311Packages.prettytable
    ];

    text = ''
      #!${pkgs.python311}/bin/python

      ${builtins.readFile ./fts.py}
    '';
  };
}
