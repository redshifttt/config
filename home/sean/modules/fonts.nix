{ pkgs, inputs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      cantarell-fonts
      public-sans
      liberation_ttf
      terminus_font
      dejavu_fonts
      noto-fonts
    ;
    inherit (inputs.self.packages.x86_64-linux) fantasque-sans-mono;
  };
}
