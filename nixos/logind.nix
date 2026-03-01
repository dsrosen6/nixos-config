{
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";

    # let hyprdocked handle all of this, prevent race conditions
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };
}
