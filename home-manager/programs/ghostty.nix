{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      # command = "/bin/zsh";
      click-repeat-interval = 500;

      font-family = "Fantasque Sans Mono";
      font-size = 12;
      font-feature = [ "-calt" "ss01" ];
      adjust-cell-height = 5;
      adjust-cursor-height = 5;
      adjust-underline-position = 3;

      window-decoration = "server";
      window-padding-x = 10;
      window-padding-y = 8;

      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      confirm-close-surface = false;

      theme = "Moonfly";
    };
  };
}
