{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = false;
        decorations = "none";
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
        normal = {
          family = "Terminus";
          style = "Regular";
        };

        bold = {
          family = normal.family;
          style = "Bold";
        };

        italic = {
          family = normal.family;
          style = "Italic";
        };

        bold_italic = {
          family = normal.family;
          style = "Bold Italic";
        };

        size = 11.0;
      };
      draw_bold_text_with_bright_colors = false;
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
        thickness = 0.15;
      };
      live_config_reload = true;
      mouse = {
        double_click = {threshold = 300;};
        triple_click = {threshold = 300;};

        hide_when_typing = false;
      };
      key_bindings = [
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
      # exported from onedarkpro.nvim
      colors = {
        primary = {
          background = "0x282c34";
          foreground = "0xabb2bf";
        };
        normal = {
          black = "0x282c34";
          red = "0xef596f";
          green = "0x89ca78";
          yellow = "0xe5c07b";
          blue = "0x61afef";
          magenta = "0xd55fde";
          cyan = "0x2bbac5";
          white = "0xabb2bf";
        };
        bright = {
          black = "0x3e4451";
          red = "0xf38897";
          green = "0xa9d89d";
          yellow = "0xedd4a6";
          blue = "0x8fc6f4";
          magenta = "0xe089e7";
          cyan = "0x4bced8";
          white = "0xc8cdd5";
        };
        shell = {
          program = "/usr/bin/env bash";
        };
      };
    };
  };
}
