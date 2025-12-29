{ config, ... }:
{

  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
  };

  home.hyprdynamicmonitors = {
    enable = true;
    configFile = ../../dotfiles/hyprdynamicmonitors/config.toml;
    extraFiles = {
      "hyprdynamicmonitors/hyprconfigs" = ../../dotfiles/hyprdynamicmonitors/hyprconfigs;
    };
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
