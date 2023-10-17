{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../users/sean
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
    hostName = "ceres";
    networkmanager.enable = true;
    stevenblack.enable = true;
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  security = {
    rtkit.enable = true; # For pipewire usually
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        { groups = [ "wheel" ]; persist = true; }
      ];
    };
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
    zsh.enable = true;
	};

  nix.settings.experimental-features = ["nix-command" "flakes"];

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
          cbatticon
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

    openssh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git # Needed for doas to be able to use git via root when using nixos-rebuild
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}

