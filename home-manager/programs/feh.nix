{ pkgs, ... }:
{
  programs.feh = {
    enable = true;
    buttons = {
      zoom_in = 4;
      zoom_out = 5;
    };
    keybindings = {
      next_img = "n";
      prev_img = "p";
      # delete = "d";
    };
    themes.feh = [
      "--image-bg" "black"
      "-."
      "--on-last-slide" "hold"
      "-e" "${pkgs.noto-fonts}/share/fonts/noto/NotoSans.ttf/12"
      "-M" "${pkgs.noto-fonts}/share/fonts/noto/NotoSans.ttf/11"
    ];
  };
}
