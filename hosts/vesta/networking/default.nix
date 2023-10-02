{
  networking = {
    hostName = "vesta";
    networkmanager.enable = true;
    stevenblack.enable = true;
    extraHosts = ''
      # Extra Hosts
      0.0.0.0 bbc.co.uk
    '';
  };

}
