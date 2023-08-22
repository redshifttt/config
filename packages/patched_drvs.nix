{ pkgs, ... }:

with pkgs; {
  fantasque-sans-mono = fantasque-sans-mono.overrideAttrs (final: prev: {
    pname = prev.pname + "-ss01";
    src = fetchzip {
      url = "https://github.com/belluzj/fantasque-sans/releases/download/v${prev.version}/FantasqueSansMono-NoLoopK.zip";
      stripRoot = false;
      hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
    };
  });
}
