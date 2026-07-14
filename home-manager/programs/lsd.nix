{
  programs.lsd = {
    enable = true;
    enableZshIntegration = false;
    enableBashIntegration = false;
    enableFishIntegration = false;
    settings = {
      date = "relative";
      sorting.dir-grouping = "first";
      indicators = true;
    };
  };
}
