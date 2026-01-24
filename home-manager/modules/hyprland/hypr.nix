{
  pkgs,
  config,
  dotfiles,
  ...
}:
{

  imports = [
    ./swappy.nix
  ];

  home.packages = with pkgs; [
    grim
    rofi
    slurp
  ];

  # hypr config files are symlinked for quick reload without rebuild
  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
    "rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/rofi";
    "waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/waybar";
    "swaync".source = "${dotfiles}/swaync";
  };

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      # prevent waybar from starting with KDE
      target = "wayland-session@Hyprland.target";
    };
  };

  programs.hyprlock.enable = true;
  services = {
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
