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
  ];

  home.packages = with pkgs; [
    grim
    slurp
  ];

  # hypr config files are symlinked for quick reload without rebuild
  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/hypr";
    "quickshell".source = config.lib.file.mkOutOfStoreSymlink "/home/danny/nixos/dotfiles/quickshell";
    "swaync".source = "${dotfiles}/swaync";
  };

  programs = {
    hyprlock.enable = true;
    quickshell = {
      enable = true;
      systemd.enable = true;
    };
  };

  services = {
    hyprdocked.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
