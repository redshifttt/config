{
  services.polybar = {
    enable = true;

    config = ./config.ini;

    script = ''
      polybar main &
    '';
  };
}
