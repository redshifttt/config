{
  config,
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    font = {
      name = "Cantarell";
      size = 11;
    };
  };
}
