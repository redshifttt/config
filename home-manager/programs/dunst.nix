{
  services.dunst = {
    enable = true;
    settings = let
      urgency_low = {
        background = "#000000";
        foreground = "#ffffff";
        frame_color = "#111111";
        timeout = 5;
      };
    in {
      global = {
        width = "(0, 500)";
        height = 800;
        offset = "20x40";
        padding = 10;
        horizontal_padding = 10;
        frame_width = 1;
        gap_size = 4;
        corner_radius = 2;
        min_icon_size = 64;

        font = "Rubik 12";
        markup = "full";
        line_height = 4;
        ellipsize = "end";
        format = "<span fgcolor='#aaa'><b>%s</b></span>\\n%b";

        hide_duplicate_count = true;
        show_indicators = "no";

        mouse_left_click = "do_action, open_url, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "context";
      };

      inherit urgency_low;
      urgency_normal = urgency_low;

      urgency_critical = {
        background = "#ff0000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };
}
