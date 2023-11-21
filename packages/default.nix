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

  st = pkgs.st.overrideAttrs (final: prev: {
    patches = [
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/xresources/st-xresources-20200604-9ba7ecf.diff";
        hash = "sha256-8HV66XrTJu80H0Mwws5QL7BV6L9omUH6avFJqdDC7as=";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.5.diff";
        hash = "sha256-WN/R6dPuw1eviHOvVVBw2VBSMDtfi1LCkXyX36EJKi4=";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff";
        hash = "sha256-IhrTgZ8K3tcf5HqSlHm3GTacVJLOhO7QPho6SCGXTHw=";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.9.diff";
        hash = "sha256-JugrLvbnacZ6SfVl+V6tLM30LEKWBnRi6WM9oJR9OAA=";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/vertcenter/st-vertcenter-20231003-eb3b894.diff";
        hash = "sha256-RbFNdGNi5HLAp1s8QOX3qsfxpkLcp1p/vksyZORN/uc=";
      })
    ];
  });
}
