{
  programs.git = {
    enable = true;
    settings = {
      user.email = "num@privatevoid.net";
      user.name = "redshifttt";
      core = {
        whitespace = "trailing-space,space-before-tab";
      };
      url = {
        "ssh://git@host" = {
          insteadOf = "otherhost";
        };
      };
      init.defaultBranch = "master"; # shut the fuck up
    };
  };

  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
      file-decoration-style = "overline blue bold";
      hunk-header-style = "omit";
      relative-paths = true;
      right-arrow = " -> ";
      tabs = 4;
    };
  };
}
