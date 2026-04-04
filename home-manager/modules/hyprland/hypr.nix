let
  hlTarget = "wayland-session@Hyprland.target";
in
{
  pkgs,
  lib,
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
    };
  };

  programs.hyprlock.enable = true;
  services = {
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
    swaync.enable = true;
    swayosd.enable = true;
  };

  # prevent these items from starting in other DEs
  systemd.user.services = {
    swaync.Install.WantedBy = lib.mkForce [ hlTarget ];
    swayosd.Install.WantedBy = lib.mkForce [ hlTarget ];
    waybar.Install.WantedBy = lib.mkForce [ hlTarget ];
  };
}
