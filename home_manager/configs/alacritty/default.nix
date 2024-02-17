{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 8;
        };
        dynamic_padding = false;
        decorations = "full";
        startup_mode = "Maximized";
        title = "Alacritty";
        dynamic_title = true;
        opacity = 1.0;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = rec {
        normal = { family = "Terminus"; style = "Regular"; };
        italic = { inherit (normal) family style; };

        bold = { inherit (normal) family; style = "Bold"; };
        bold_italic = { inherit (bold) family style; };

        size = 10.0;

        offset = {
          y = 4;
        };
        glyph_offset = {
          y = (offset.y / 2);
        };
      };

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
        vi_mode_style = "None";
        unfocused_hollow = true;
        thickness = 1;
      };

      live_config_reload = true;

      mouse = {
        hide_when_typing = false;
      };

      keyboard.bindings = [
        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];

      debug = {
        render_timer = false;
        persistent_logging = false;
        log_level = "Error";
        print_events = false;
      };

      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xB3B1AD";
        };
        normal = {
          black = "0x000000";
          red = "0xEA6C73";
          green = "0x91B362";
          yellow = "0xF9AF4F";
          blue = "0x53BDFA";
          magenta = "0xcb9ff8";
          cyan = "0x90E1C6";
          white = "0xC7C7C7";
        };
        bright = {
          black = "0x000000";
          red = "0xF07178";
          green = "0xC2D94C";
          yellow = "0xFFB454";
          blue = "0x59C2FF";
          magenta = "0xcb9ff8";
          cyan = "0x95E6CB";
          white = "0xFFFFFF";
        };
        draw_bold_text_with_bright_colors = false;
      };
    };
  };
}
