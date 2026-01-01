{ config, ... }:
{

  # hypr config files are symlinked for quick reload without rebuild
  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
  };

  programs.hyprlock.enable = true;
  services = {
    hyprpaper.enable = true;
    hypridle.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
