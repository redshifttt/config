{ lib, ... }:

{
  home.file.".config/i3blocks/config" = {
    enable = true;
    text = lib.generators.toINIWithGlobalSection {} {
      globalSection = {
        separator = true;
        separator_block_width = 15;
      };
      sections.time = { # do you really need more? lol
        command = "date +'%F (%a) %T %Z'";
        interval = 1;
        };
    };
  };
}
