{
  # :(
  nixpkgs.config.allowUnfree = true;

  fonts.fontDir.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # TODO: This could become an issue for hosts which do not use X11. Maybe create a conditional or something.
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
  };

  nix = {
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
}
