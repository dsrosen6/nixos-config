{ config, pkgs, ... }:
{
  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";
  };

  services = {
    hyprpolkitagent.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ ".config/wallpapers/windwaker-island.jpg" ];
        wallpaper = [ ", .config/wallpapers/windwaker-island.jpg" ];
      };
    };

    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof swaylock || swaylock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

  };
}
