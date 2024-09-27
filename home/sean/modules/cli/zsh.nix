{ inputs, pkgs, ... }:
{
  programs.zsh = let
    LS_COLORS = inputs.self.packages.x86_64-linux.LS_COLORS;
    fts = inputs.self.packages.x86_64-linux.fts;
  in {
    enable = true;

    autosuggestion.enable = true;
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

    # https://unix.stackexchange.com/a/71258

    initExtra = ''
      export PS1="%B%F{#ffffff}%n%f%b@%F{magenta}%m%f %B%F{blue}%c%f%b %# "

      export BROWSER=librewolf
      export TERMINAL=alacritty;
      export MANPAGER="nvim +Man!"
      export MANWIDTH=80

      bindkey "^[[A" up-line-or-search
      bindkey "^[[B" down-line-or-search

      bindkey '^I' complete-word
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey '^Y' autosuggest-accept
      bindkey -r "^F"
      bindkey -s '^F' "fcd"

      function fcd() {
        cd "$(bfs "$HOME" -type d -nocolor 2>/dev/null | fzf --height=40% --reverse)"
      }

      source ${LS_COLORS}/share/lscolors.sh
      '';

    shellAliases = {
      grep = "grep --color=auto";
      lsblk = "lsblk -o \"NAME,FSTYPE,FSAVAIL,FSUSE%,SIZE,TYPE,MOUNTPOINT\" -p";
      ls = "lsd -lh"; # apparently these 2 options cannot be added to the config file
      cat = "bat --pager=never --style \"header,numbers\"";
      mkdir = "mkdir -pv";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";

      # don't like using git's own alias system
      gs = "git status";
      gp = "git push";
      gP = "git pull";
      gl = "git log --relative-date";
      gc = "git commit";

      fts = "${fts}/bin/fts";
    };
  };
}
