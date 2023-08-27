{
  writeShellScriptBin,
  pkgs
}:

writeShellScriptBin "scrot" ''
  SCREENSHOTS_DIR_FORMAT="/home/sean/files/images/screenshots/$(date +'%Y/%m %B/%d')"
  [[ ! -d "$SCREENSHOTS_DIR_FORMAT" ]] && mkdir -p "$SCREENSHOTS_DIR_FORMAT"

  selection=$(${pkgs.slop}/bin/slop -f "-i %i -g %g")
  ${pkgs.shotgun}/bin/shotgun $selection - \
    | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png
  ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png -o > "$SCREENSHOTS_DIR_FORMAT/$(date +'%F_%H-%M-%S').png"
''
