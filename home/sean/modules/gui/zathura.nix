{
  programs.zathura = {
    enable = true;
    options = {
      sandbox = "none";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 5;
      selection-clipboard = "clipboard";
      font = "liberation mono 12";
      recolor-lightcolor = "#000000";
      recolor-darkcolor = "#BEBAC6";
    };
    mappings = {
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      "=" = "zoom in";
      "-" = "zoom out";
      i = "recolor";
      p = "print";
      g = "goto top";
    };
  };
}
