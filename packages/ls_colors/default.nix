{
  stdenv,
  fetchFromGitHub,
  lib,
}:
stdenv.mkDerivation {
  pname = "LS_COLORS";
  version = "master";

  src = fetchFromGitHub {
    owner = "trapd00r";
    repo = "LS_COLORS";
    rev = "master";
    hash = "sha256-DT9WmtyJ/wngoiOTXMcnstVbGh3BaFWrr8Zxm4g4b6U=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share
    make generate
    cp lscolors.sh $out/share/
  '';

  meta = {
    description = "A collection of LS_COLORS definitions";
    homepage = "https://github.com/trapd00r/LS_COLORS";
    license = lib.licenses.artistic1;
    platforms = lib.platforms.linux;
  };
}
