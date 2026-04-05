{ pkgs, ... }:
{
  # Anything that is Hyprland specific that needs to be in a nixos module goes here
  # so I can avoid importing if I am not using Hyprland. Just don't want to get rid
  # of it all just in case.

  environment.systemPackages = with pkgs; [
    wl-clipboard
    linuxPackages.cpupower
  ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";

    # let hyprdocked handle all of this, prevent race conditions
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };
}
