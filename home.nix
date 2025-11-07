{ config, pkgs, ... }:
{
  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    packages = with pkgs; [
      playerctl
      spotify
      gh
      python314
      gobject-introspection
      go
      nodejs
      lazygit
      jetbrains.goland
    ];
  };

  services = {
    cliphist.enable = true;
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

  programs = {
    rofi.enable = true;
  };
}
