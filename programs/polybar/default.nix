{
  services.polybar = {
    enable = true;

    config = {
      "colors" = {
        background = "#050505";
        foreground = "#ffffff";
      };

      "bar/main" = {
        width = "100%";
        height = "24pt";
        radius = 0;

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        border-size = "0px";
        border-color = "#000000";

        padding-left = 1;
        padding-right = 1;

        module-margin = 1;

        separator = "";

        font-0 = "Monaspace Xenon:size=10.0;2";
        font-1 = "Monaspace Xenon:weight=bold:size=10.0;2";

        modules-left = "xworkspaces";
        modules-center = "dateandtime";
        modules-right = "";
        fixed-center = true;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;

        tray-position = "right";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        enable-click = false;
        enable-scroll = false;

        label-active = "%name%";
        label-active-font = 2;
        label-active-background = "#111111";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-foreground = "#333333";
        label-occupied-padding = 1;

        label-urgent = "%name%";
        label-urgent-background = "#ff0000";
        label-urgent-foreground = "#ffffff";
        label-urgent-padding = 1;
      };

      "module/dateandtime" = {
        type = "custom/script";
        exec = "~/dotfiles/programs/polybar/dateandtime";
        interval = 1;
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
