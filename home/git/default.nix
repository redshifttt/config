{
  programs.git = {
    enable = true;
    delta = {
      enable = true;
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
