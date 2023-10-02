{ pkgs, ... }:
{
  LS_COLORS = pkgs.callPackage ./ls_colors {};

  local-scripts = pkgs.callPackage ./local-scripts {};

  firefox-addons = pkgs.callPackage ./firefox-addons {};

  fantasque-sans-mono = pkgs.fantasque-sans-mono.overrideAttrs (final: prev: {
    pname = prev.pname + "-ss01";
    src = pkgs.fetchzip {
      url = "https://github.com/belluzj/fantasque-sans/releases/download/v${prev.version}/FantasqueSansMono-NoLoopK.zip";
      stripRoot = false;
      hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
    };
  });

  terminus_font_fancy = pkgs.terminus_font.overrideAttrs (attrs: {
    patches = (attrs.patches or [ ]) ++ [ "alt/td1.diff" ];
  });
}
