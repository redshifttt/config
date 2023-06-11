{
  config,
  pkgs,
  lib,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = rec {
      global = {
        monitor = 0;
        follow = "none";
        width = "(0, 500)";
        height = 800;
        origin = "top-right";
        offset = "20x40";
        scale = 0;
        notification_limit = 0;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 10;
        horizontal_padding = 10;
        text_icon_padding = 0;
        frame_width = 0;
        gap_size = 4;
        separator_color = "frame";
        sort = "yes";
        font = "Cantarell 10";
        line_height = 2;
        markup = "full";
        format = "<span rise=\"15pt\"><big><b>\\%s</b></big></span>\n\\%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "end";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = true;
        show_indicators = "no";
        sticky_history = "yes";
        history_length = 20;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 0;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#000000";
        foreground = "#cccccc";
        timeout = 10;
      };
      urgency_normal = urgency_low;
      urgency_critical = {
        background = "#EC5959";
        foreground = "#BEBAC6";
        timeout = 0;
      };
    };
  };
}
