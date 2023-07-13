{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "gb";
      displayManager.defaultSession = "none+i3";
      desktopManager.xterm.enable = false;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          bemenu
          i3blocks
          dunst
          picom
          networkmanagerapplet
          xwallpaper
        ];
      };
      videoDrivers = [ "amdgpu" ];
    };

    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    mullvad-vpn.enable = true;

    openssh.enable = false;
  };
}
