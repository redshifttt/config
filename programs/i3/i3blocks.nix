{ lib, ... }:

{
  home.file.".config/i3blocks/config" = {
    enable = true;
    text = lib.generators.toINIWithGlobalSection {} {
      globalSection = {
        separator = true;
        separator_block_width = 15;
      };
      sections = { # do you really need more? lol
        time = {
          command = "date '+%Y-%m-%d (%a) %H:%M:%S'";
          interval = 1;
        };
      };
    };
  };
}
