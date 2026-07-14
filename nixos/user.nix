{ pkgs, ... }:
{
  users.users.sean = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
    shell = pkgs.zsh;
  };
}
