{
  config,
  pkgs,
  lib,
  ...
}: {
  services.picom = {
        enable = true;
        backend = "glx";
        fade = true;
        fadeSteps = [ 0.6 0.6 ];
        inactiveOpacity = 1;
        activeOpacity = 1;
        shadow = false;
        vSync = true;
  };
}
