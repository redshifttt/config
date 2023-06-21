{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.bash = rec {
    enable = true;

    enableVteIntegration = true;

    sessionVariables = {
      PS1 = "\\[\\033[1;34m\\]\\W\\[\\033[0m\\] \\$ ";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
      MANPAGER = "nvim +Man!";
    };

    shellAliases = {
      grep = "grep --color=auto";
      lsblk = "lsblk -o \"NAME,FSTYPE,FSAVAIL,FSUSE%,SIZE,TYPE,MOUNTPOINT\" -p";
      ls = "lsd -lhF --group-dirs first --date relative --icon never";
      cat = "bat --pager=never";
      mkdir = "mkdir -pv";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      soda = "ssh -p 52222 num@soda.privatevoid.net";
      dragon = "dragon-drag-and-drop";
      # suspend = "systemctl suspend";
      ncdu = "ncdu --color off";
      ytdl = "yt-dlp";
      ytba = "yt-dlp -f bestaudio";
      ytmp3 = "yt-dlp -x --extract-audio --audio-format mp3";
    };

    shellOptions = [
      "checkwinsize"
      "cdspell"
    ];

    bashrcExtra = ''
      export PS1="${sessionVariables.PS1}"
      fcd(){
          local selection
          selection=$(fd . $HOME -H -j12 -E "*.cache*" -I | fzf +m --prompt="cd: " --tiebreak=begin --scheme=path)
          [[ ! -d "$selection" ]] && cd "$(dirname $selection 2>/dev/null)" || cd "$selection" || exit
      }

      fkill(){ kill $(ps -eo pid,user,command | fzf | awk '{print $1}') ;}
      unix(){ date -d @"$1" +'%a, %e %B %Y, %T %Z %z'; }
      list_fonts(){
          fc-list -b | grep "fullname:" | sed 's|(.*||;s|.*fullname:\s||;s|"||g' | sort | uniq | nl
      }
    '';

    profileExtra = ''
      source ~/.bashrc
    '';
  };
}
