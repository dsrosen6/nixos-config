{ config, ... }:
{

  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
    "hyprdynamicmonitors".source =
      config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hyprdynamicmonitors";
  };

  home.hyprdynamicmonitors = {
    enable = true;
    extraFlags = [
      "--enable-lid-events"
    ];
  };

  services = {
    hyprpaper.enable = true;
    hypridle.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
