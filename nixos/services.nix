{
  services = {
    # Disabled because GNOME enables this by default and it overrides CPU power settings
    # and makes things big slow
    power-profiles-daemon.enable = false;

    # desktopManager.gnome.enable = true;
    # displayManager.gdm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    blueman.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    udev.extraRules = ''
      # Stops the Logi bolt receiver from immediately waking the device from suspend.
      ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"

      # Allow access to Keychron keyboards for QMK/VIA
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0666", TAG+="uaccess"
    '';

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    libinput.enable = true;
    printing.enable = true;
  };
}
