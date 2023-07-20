{ inputs, pkgs, ... }:
{
  programs.zsh = let
    customPackage = inputs.self.packages.${pkgs.system};
  in {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    dotDir = ".config/zsh";

    initExtra = ''
      PS1="%B%F{magenta}%m%f %F{blue}%c%f%b %# "
      source ${customPackage.LS_COLORS}/share/lscolors.sh
      '';

    sessionVariables = {
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
      ncdu = "ncdu --color off";
      ytdl = "yt-dlp";
      ytba = "yt-dlp -f bestaudio";
      ytmp3 = "yt-dlp -x --extract-audio --audio-format mp3";

      gs = "git status";
      gp = "git pull";
      gc = "git commit";
      gl = "git log";
    };
  };
}
