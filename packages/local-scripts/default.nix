{
  writeScriptBin,
  writeShellScriptBin,
  writeShellApplication,
  pkgs
}:
{
  scrot = writeShellApplication {
    name = "scrot";

    runtimeInputs = [ pkgs.slop pkgs.shotgun pkgs.xclip ];

    text = builtins.readFile ./scrot;
  };

  fcd = writeShellApplication {
    name = "fcd";

    runtimeInputs = [ pkgs.bfs pkgs.fzf ];

    text = ''
      cd "$(bfs $HOME -type d -nocolor 2>/dev/null | fzf --height=40% --reverse)"
    '';
  };

  fts = writeScriptBin "fts" ''
  #!${pkgs.python311}/bin/python

  ${builtins.readFile ./fts.py}
  '';
}
