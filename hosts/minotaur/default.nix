{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./services.nix
    ./../common.nix
    ./../../home/sean/user.nix
  ];

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

  programs = {
    steam.enable = true;
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  system.stateVersion = "23.11";
}
