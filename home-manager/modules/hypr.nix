{ config, ... }:
{

  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
  };

  services = {
    hyprpaper.enable = true;
    hypridle.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
