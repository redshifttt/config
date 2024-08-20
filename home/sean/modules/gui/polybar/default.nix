{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    config = let
      background = "#000000";
      foreground = "#ffffff";
    in
      {
      "colors" = {
        inherit background foreground;
      };

      "bar/main" = {
        width = "100%";
        height = "24";
        radius = 0;

        inherit background foreground;

        border-size = "5px";
        border-color = background;

        padding-left = 1;
        padding-right = 1;

        module-margin = 2;

        separator = "";

        font-0 = "Rubik:size=12.0;2";
        font-1 = "Rubik:weight=bold:size=12.0;2";

        modules-left = "xworkspaces";
        modules-center = "dateandtime";
        modules-right = "rootsize tray";

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
        label-active-font = 2;
        label-active-background = "#000000";
        label-active-foreground = "#eeeeee";
        label-active-padding = 2;
        label-active-margin-right = 4;

        label-occupied = "%name%";
        label-occupied-font = 2;
        label-occupied-background = "#000000";
        label-occupied-foreground = "#333333";
        label-occupied-padding = 2;
        label-occupied-margin-right = 4;

        label-urgent = "%name%";
        label-urgent-font = 2;
        label-urgent-background = "#ff0000";
        label-urgent-foreground = "#ffffff";
        label-urgent-padding = 2;
        label-urgent-margin-right = 4;
      };

      "module/dateandtime" = {
        type = "custom/script";
        exec = builtins.toString ./dateandtime;
        interval = 1;
      };

      "module/rootsize" = {
        type = "custom/script";
        exec = "df -h --output=\"avail,pcent\" / | sed 1d | awk '{printf \"%sB left (%s used) in /\", $1, $2}'";
        interval = 1;
      };

      "module/tray" = {
        type = "internal/tray";
        tray-spacing = "15px";
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

  home.packages = [ pkgs.rubik ];
}
