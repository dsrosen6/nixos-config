{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "danny";
      dataDir = "/home/danny";
    };
  };
}
