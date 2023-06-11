{
  config,
  pkgs,
  callPackage,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "auto";
      editor = false;
      configurationLimit = 20;
    };
    efi.canTouchEfiVariables = true;
    timeout = 5;
  };

  networking = {
    hostName = "vesta";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  services.xserver = {
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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.sean = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  environment.systemPackages = with pkgs; [];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services.openssh.enable = false;

  programs.dconf.enable = true;

  system.stateVersion = "23.11";
}
