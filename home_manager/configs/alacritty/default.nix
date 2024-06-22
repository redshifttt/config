{ lib, ... }:
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
        normal = { family = "FantasqueSansM Nerd Font"; style = "Regular"; };
        italic = { inherit (normal) family style; };

        bold = { inherit (normal) family; style = "Bold"; };
        bold_italic = { inherit (bold) family style; };

        size = 10;

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
    } // (lib.trivial.importTOML ./moonfly-alacritty.toml);
  };
}
