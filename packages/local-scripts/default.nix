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

  fts = writeScriptBin "fts" ''
  #!${pkgs.python311}/bin/python

  ${builtins.readFile ./fts.py}
  '';
}
