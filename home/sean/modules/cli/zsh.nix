{ inputs, pkgs, ... }:
{
  programs.zsh = let
    customPackage = inputs.self.packages.${pkgs.system};
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

      bindkey "^[[A" up-line-or-search
      bindkey "^[[B" down-line-or-search

      bindkey '^I' complete-word
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey '^Y' autosuggest-accept
      bindkey -r "^F"
      bindkey -s '^F' "fcd"

      # Saner defaults
      export BEMENU_OPTS='--fn "Liberation Mono 12" --hb "#005577" --hf "#eeeeee" --tb "#005577" --tf "#eeeeee" --hp 10'

      function fcd() {
        cd "$(bfs "$HOME" -type d -nocolor 2>/dev/null | fzf --height=40% --reverse)"
      }

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
      ls = "lsd -lh"; # apparently these 2 options cannot be added to the config file
      cat = "bat --pager=never";
      mkdir = "mkdir -pv";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";

      # HACK: Call on script. Hacky but seems to work.
      fts = "${customPackage.fts}/bin/fts";
    };
  };
}
