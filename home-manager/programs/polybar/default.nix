{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    config = let
      background = "#000000";
      foreground = "#dddddd";
    in
      {
      "colors" = {
        inherit background foreground;
      };

      "bar/main" = {
        width = "100%";
        height = "32";
        radius = 0;

        inherit background foreground;

        border-bottom-size = "1px";
        border-bottom-color = "#111111";

        padding = 2;

        module-margin = 1;

        separator = "   ";

        font-0 = "Noto Sans:size=11.0;2";

        modules-left = "xworkspaces";
        modules-center = "";
        modules-right = "tray rootsize";

        fixed-center = true;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        enable-click = false;
        enable-scroll = false;

        label-active = "%name%";
        label-active-background = background;
        label-active-foreground = "#eeeeee";
        label-active-padding = 2;
        label-active-margin-right = 4;

        label-occupied = "%name%";
        label-occupied-background = background;
        label-occupied-foreground = "#333333";
        label-occupied-padding = 2;
        label-occupied-margin-right = 4;

        label-urgent = "%name%";
        label-urgent-background = "#ff0000";
        label-urgent-foreground = "#ffffff";
        label-urgent-padding = 2;
        label-urgent-margin-right = 4;
      };

      "module/rootsize" = {
        type = "custom/script";
        exec = "df -h --output=\"avail,pcent\" / | sed 1d | awk '{printf \"%sB left (%s used) in /\", $1, $2}'";
        interval = 1;
      };

      "module/tray" = {
        type = "internal/tray";
        tray-padding = "2px";
        tray-size = "65%";
        tray-background = "#080808";
        format-background = "#080808";
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };

    script = ''
      polybar main &
    '';
  };
}
