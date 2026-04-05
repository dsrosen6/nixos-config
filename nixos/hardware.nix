{
  hardware = {
    bluetooth.enable = true;
  };

  services = {
    libinput.enable = true;
    printing.enable = true;

    udev.extraRules = ''
      # Stops the Logi bolt receiver from immediately waking the device from suspend.
      ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"

      # Allow access to Keychron keyboards for QMK/VIA
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0666", TAG+="uaccess"
    '';
  };
}
