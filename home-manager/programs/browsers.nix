{ pkgs, config, ... }:
{
  programs = {
    firefox.enable = true;
    firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
    librewolf = {
      enable = true;
      # TODO: when it eventually gets updated remove this workaround
      package = pkgs.librewolf-bin;
    };
  };
}
