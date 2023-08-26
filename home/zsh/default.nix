{ inputs, pkgs, ... }:
{
  programs.zsh = let
    customPackage = inputs.self.packages.${pkgs.system};
  in {
    enable = true;

    enableAutosuggestions = true; # temp change
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    dotDir = ".config/zsh";

    initExtra = ''
      PS1="%B%F{magenta}%m%f %F{blue}%c%f%b %# "
      bindkey '^I' complete-word
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey '^Y' autosuggest-accept

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#111111,bold,underline,bg=#000000"

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
      gp = "git push";
      gc = "git commit";
      gl = "git log";

      fcd = "cd \"$(bfs $HOME -type d 2>/dev/null | fzf)\"";

      hmswitch = "home-manager switch --flake .";
      nixrebuild = "sudo nixos-rebuild switch --flake .";
    };
  };
}
