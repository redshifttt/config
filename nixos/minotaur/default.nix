{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./services.nix
    ./../../users/sean
  ];

  # :(
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

  security.rtkit.enable = true; # For pipewire usually
  security.sudo.enable = true; # For pipewire usually

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

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  nix = {
    # package = pkgs.nixVersions.latest;
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
    };
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };

  documentation = {
    # why does anyone even use info pages?
    info.enable = false;
    doc.enable = false;
  };

  system.stateVersion = "23.11";
}
