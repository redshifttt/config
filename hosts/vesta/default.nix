{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./services
    ./nixpkgs
  ];

  environment.systemPackages = with pkgs; [
    git # Needed for doas to be able to use git via root when using nixos-rebuild
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
    kernelParams = [ "quiet" ];
    consoleLogLevel = 3;
  };

  networking = {
    hostName = "vesta";
    networkmanager.enable = true;
    stevenblack.enable = true;
    extraHosts = ''
      # Extra Hosts
      0.0.0.0 bbc.co.uk
    '';
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

  virtualisation.libvirtd.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "23.11";
}
