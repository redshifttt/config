{ lib, ... }:

{
  home.file.".config/i3blocks/config" = {
    enable = true;
    text = lib.generators.toINIWithGlobalSection {} {
      globalSection = {
        separator = true;
        separator_block_width = 15;
      };
      sections = {
        rootsize = {
          command = "df -h --output=\"avail,pcent\" / | sed 1d | awk '{printf \"%sB left (%s used) in /\\n\", $1, $2}'";
          interval = 1;
        };
        time = {
          command = "date +'%F (%a) %T %Z'";
          interval = 1;
        };
      };
    };
  };
}
