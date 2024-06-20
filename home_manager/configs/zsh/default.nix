{ inputs, pkgs, lib, ... }:
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

    plugins = [
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    initExtra = ''
      PS1="%B%F{#ffffff}%n%f%b@%F{magenta}%m%f %B%F{blue}%c%f%b %# "

      bindkey "^[[A" up-line-or-search
      bindkey "^[[B" down-line-or-search

      bindkey '^I' complete-word
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey '^Y' autosuggest-accept
      bindkey -r "^F"
      bindkey -s '^F' "fcd"

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#111111,bold,underline,bg=#000000"
      FZF_DEFAULT_OPTS="--height=20 --layout=reverse"

      # Saner defaults
      BEMENU_OPTS='--fn "Liberation Mono 12" --hb "#005577" --hf "#eeeeee" --tb "#005577" --tf "#eeeeee" --hp 10'

      source ${customPackage.LS_COLORS}/share/lscolors.sh
      '';

    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "alacritty";
      MANPAGER = "nvim +Man!";
      MANWIDTH = 80;
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

      # HACK: Call on script. Hacky but seems to work.
      fts = "${customPackage.local-scripts.fts}/bin/fts";
      fcd = "${customPackage.local-scripts.fcd}/bin/fcd";

      sudo = "doas";
    };
  };
}
