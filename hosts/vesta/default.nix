{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./services
    ./../../users/sean
  ];

  nixpkgs.config.allowUnfree = true;

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
    kernelParams = [ "quiet" ];
    consoleLogLevel = 3;
  };

  networking = {
    hostName = "vesta";
    networkmanager.enable = true;
    stevenblack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git # Needed for doas to be able to use git via root when using nixos-rebuild
  ];

  fonts.fontDir.enable = true;

  fonts.packages = [ pkgs.dejavu_fonts ];
  fonts.enableDefaultPackages = true;

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
    steam.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
    };
    extraOptions = ''
      experimental-features = nix-command flakes repl-flake
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d --max-freed 16G";
    };
  };

  system.stateVersion = "23.11";
}
