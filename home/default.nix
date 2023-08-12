{ pkgs, inputs, lib, stdenv, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./i3
    ./zsh
    ./alacritty
    ./xdg
    ./gtk
    ./feh
    ./zathura
    ./mpv
    ./picom
    ./dunst
    ./polybar
    ./git
    ./newsboat
  ];

  home = {
    username = "sean";
    homeDirectory = "/home/sean";
    stateVersion = "23.05";

    packages = with pkgs; [
      fzf
      bat
      lsd
      firefox
      librewolf
      git
      terminus_font
      cantarell-fonts
      mpv
      alacritty
      ripgrep
      feh
      zathura
      virt-manager
      mullvad-vpn
      nil
      easyeffects
      ckan
      bfs
      audacity
      liberation_ttf
      fira-mono
      fira
      newsboat
      xclip
      xsel

      (fantasque-sans-mono.overrideAttrs (final: prev: {
        pname = prev.pname + "-ss01";
        src = pkgs.fetchzip {
          url = "https://github.com/belluzj/fantasque-sans/releases/download/v${prev.version}/FantasqueSansMono-NoLoopK.zip";
          stripRoot = false;
          hash = "sha256-RnnyhP2zdRGk4XUe4fSibMFBhZmMqoKziE6TzcCSiL0=";
        };
      }))
    ];
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.firefox = {
    enable = true;
    profiles."default" = {
      name = "default";
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        force = true;
        order = [ "DuckDuckGo" ];
        # TODO: refactor the below to be more dynamic.
        engines = {
          "DuckDuckGo" = {
            urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
          };
          "Google".metaData.hidden = true;
          "Amazon.co.uk".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
      extraConfig = let
        arkenfox = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js";
          hash = "sha256-sysEtq4aEWmkKy3KPe+4J/HJxjCxNcTAzptZ7s5JrJg=";
        };
      in "${lib.strings.fileContents arkenfox}";
      extensions = with inputs.self.packages.x86_64-linux.firefox-addons; [
        ublock-origin
        violentmonkey
        bitwarden
        stylus
      ];
    };
  };
}
