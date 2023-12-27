{
  writeScriptBin,
  writeShellScriptBin,
  pkgs
}:
{
  scrot = writeShellScriptBin "scrot" ''
  #!/bin/sh

  ${builtins.readFile ./scrot}
  '';

  fts = writeScriptBin "fts" ''
  #!${pkgs.python311}/bin/python

  ${builtins.readFile ./fts.py}
  '';
}
