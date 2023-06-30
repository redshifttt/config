{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        editor = false;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
  };

  networking = {
    hostName = "vesta";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # For pipewire usually
  security.rtkit.enable = true;

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

  users.users.sean = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd"];
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "23.11";
}
