{ pkgs, inputs, ... }:

let
  inherit (builtins) attrValues;

  username = "sean";
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./configs/neovim
    ./configs/i3
    ./configs/zsh
    ./configs/alacritty
    ./configs/xdg
    ./configs/gtk
    ./configs/zathura
    ./configs/mpv
    ./configs/picom
    ./configs/dunst
    ./configs/git
    ./configs/newsboat
    ./configs/x11
    ./configs/mpd
    ./configs/tmux
    ./configs/feh
  ];

  home = {
    inherit username homeDirectory;
    stateVersion = "23.11";

    packages = let
      cliPrograms = attrValues {
        inherit (pkgs)
          bat
          lsd
          ripgrep
          bfs
          nil
          htop
          yt-dlp
          pet
          jq
          mpc-cli
          file
          unzip
          nvd
          wget
          nix-search-cli;
      };
      guiPrograms = attrValues {
        inherit (pkgs)
          easyeffects
          ckan
          audacity
          pavucontrol
          thunderbird
          # mangohud
          prismlauncher
          spotify
          libqalculate
          bitwarden
          gparted
          librewolf;
      };
      fontPackages = attrValues {
        inherit (pkgs)
          cantarell-fonts
          liberation_ttf
          terminus_font
          dejavu_fonts
          open-sans;
      };
      customPackages = attrValues {
        inherit (inputs.self.packages.x86_64-linux)
          fantasque-sans-mono;
      };
    in []
      ++ cliPrograms
      ++ guiPrograms
      ++ fontPackages
      ++ customPackages;
  };

  services.polybar = {
    enable = true;
    config = {
      "colors" = {
        background = "#000000";
        foreground = "#ffffff";
      };

      "bar/main" = {
        width = "100%";
        height = "24";
        radius = 0;

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        border-size = "5px";
        border-color = "#000000";

        padding-left = 1;
        padding-right = 1;

        module-margin = 4;

        separator = "";

        font-0 = "Cantarell:size=12.0;2";
        font-1 = "Cantarell:weight=bold:size=12.0;2";

        modules-left = "xworkspaces";
        modules-center = "dateandtime";
        modules-right = "rootsize tray";

        fixed-center = true;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        enable-click = false;
        enable-scroll = false;

        label-active = "%name%";
        label-active-font = 2;
        label-active-background = "#111111";
        label-active-foreground = "#eeeeee";
        label-active-padding = 2;
        label-active-margin-right = 4;

        label-occupied = "%name%";
        label-occupied-font = 2;
        label-occupied-background = "#000000";
        label-occupied-foreground = "#333333";
        label-occupied-padding = 2;
        label-occupied-margin-right = 4;

        label-urgent = "%name%";
        label-urgent-font = 2;
        label-urgent-background = "#ff0000";
        label-urgent-foreground = "#ffffff";
        label-urgent-padding = 2;
        label-urgent-margin-right = 4;
      };

      "module/dateandtime" = {
        type = "custom/script";
        exec = "date +'%F (%a) %T %Z'";
        interval = 1;
      };

      "module/rootsize" = {
        type = "custom/script";
        exec = "df -h --output=\"avail,pcent\" / | sed 1d | awk '{printf \"%sB left (%s used) in /\", $1, $2}'";
        interval = 1;
      };

      "module/tray" = {
        type = "internal/tray";
        tray-spacing = "15px";
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };

    script = ''
      polybar main &
    '';
  };

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
