{
  pkgs,
  config,
  dotfiles,
  inputs,
  ...
}:
{

  imports = [
    inputs.hyprdocked.homeManagerModules.default
    ./swappy.nix
    ./walker.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
  ];

  # hypr config files are symlinked for quick reload without rebuild
  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
    "swaync".source = "${dotfiles}/swaync";
  };

  programs.hyprlock.enable = true;
  services = {
    hyprdocked.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
