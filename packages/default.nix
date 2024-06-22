{ pkgs, ... }:
{
  LS_COLORS = pkgs.callPackage ./ls_colors {};

  local-scripts = pkgs.callPackage ./local-scripts {};

  fantasque-sans-mono = pkgs.fantasque-sans-mono.overrideAttrs (final: prev: {
    pname = prev.pname + "-ss01";
    src = pkgs.fetchzip {
      url = "https://github.com/belluzj/fantasque-sans/releases/download/v${prev.version}/FantasqueSansMono-NoLoopK.zip";
      stripRoot = false;
      hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
    };

    buildInputs = [ pkgs.nerd-font-patcher ];

    patchPhase = ''
      mkdir -p $out/
      for f in $src/OTF/*.otf; do
        nerd-font-patcher -c -out "." "$f"
      done
    '';

    installPhase = ''
      runHook preInstall

      install -Dm644 *.otf -t $out/share/fonts/opentype

      runHook postInstall
    '';
  });
}
