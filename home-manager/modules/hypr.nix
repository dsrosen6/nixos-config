let
  hlSrc = ../../dotfiles/hypr;
in
{
  xdg.configFile = {
    "hypr".source = "${hlSrc}";
  };

  services = {
    hyprpaper.enable = true;
    hypridle.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
  };
}
