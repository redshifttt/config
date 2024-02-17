{
  programs.git = {
    enable = true;
    delta = {
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
    extraConfig = {
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
    };
  };
}
