{ pkgs, ... }:
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
      swaylock
      rofi
    ];
  };

  services = {
    cliphist.enable = true;
    swaync.enable = true;
    hyprpolkitagent.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprsunset.enable = true;
  };

  programs = {
    swaylock.enable = true;
  };

  xdg.configFile = {
    "swaylock/config".source = ./configs/swaylock/config;
    "hypr".source = ./configs/hypr;
    "rofi".source = ./configs/rofi;
    "waybar".source = ./configs/waybar;
    "swaync".source = ./configs/swaync;
    "cliphist".source = ./configs/cliphist;
  };
}
