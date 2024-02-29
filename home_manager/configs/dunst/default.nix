{
  services.dunst = {
    enable = true;
    settings = rec {
      global = {
        width = "(0, 500)";
        height = 800;
        offset = "20x40";
        padding = 10;
        horizontal_padding = 10;
        frame_width = 0;
        gap_size = 4;

        font = "Cantarell 12";
        markup = "full";
        line_height = 2;
        ellipsize = "end";
        format = "<span size=larger>%s</span>\n%b";

        hide_duplicate_count = true;
        show_indicators = "no";

        mouse_left_click = "do_action, open_url";
        mouse_middle_click = "close_current";
        mouse_right_click = "none";
      };
      urgency_low = {
        background = "#1a1a1a";
        foreground = "#ffffff";
        timeout = 5;
      };
      urgency_normal = urgency_low;
      urgency_critical = {
        background = "#ff0000";
        foreground = "#ffffff";
        timeout = 0;
      };
    };
  };
}
