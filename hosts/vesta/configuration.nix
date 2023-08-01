{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./services
    ./../../packages/nixpkgs
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
    # stevenblack = {
    #   enable = true;
    #   block = [ "social" ];
    # };
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # For pipewire usually
  security.rtkit.enable = true;

  users.users.sean = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd"];
    shell = pkgs.zsh;
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
    zsh.enable = true;
    steam.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  virtualisation.libvirtd.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  documentation.man.generateCaches = true;

  system.stateVersion = "23.11";
}
