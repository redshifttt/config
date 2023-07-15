{
  writeShellScriptBin,
  pkgs
}:

writeShellScriptBin "scrot" ''
  sel(){
      selection=$(${pkgs.slop}/bin/slop -f "-i %i -g %g")
      ${pkgs.shotgun}/bin/shotgun $selection - | ${pkgs.xclip}/bin/xclip  -selection clipboard -t image/png
      ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png -o > "$pics_dir/$file_format.png"
  }

  folder_format=$(date +'%Y/%m %B/%d' | tr "[:upper:]" "[:lower:]")
  file_format=$(date +'%F_%H-%M-%S')

  pics_dir="$XDG_PICTURES_DIR/screenshots/$folder_format"

  [ ! -d "$pics_dir" ] && mkdir -p "$pics_dir"

  case "$1" in
      -s) sel ;; # region
  esac
''
