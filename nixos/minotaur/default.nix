{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./services.nix
    ./../../users/sean
  ];

  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        editor = false;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
  };

  networking = {
    hostName = "minotaur";
    networkmanager.enable = true;
    # Ublock in the browser already uses this hosts file; may not be needed here.
    stevenblack.enable = true;
  };

  # Needed for doas to be able to use git via root user when using nixos-rebuild
  environment.systemPackages = with pkgs; [ git ];

  fonts.fontDir.enable = true;

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
    extraOptions = "experimental-features = nix-command flakes repl-flake";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d --max-freed 16G";
    };
    registry = {
      nixpkgs.to = {
        type = "path";
        path = pkgs.path;
      };
    };
  };

  documentation = {
    # why does anyone even use info pages?
    info.enable = false;
    doc.enable = false;
  };

  system.stateVersion = "23.11";
}
