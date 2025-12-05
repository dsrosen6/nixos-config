{ inputs, ... }:
let
  dotfiles = ../../dotfiles;
in
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  xdg.configFile = {
    "walker/themes".source = "${dotfiles}/walker/themes";
    "elephant/menus".source = "${dotfiles}/elephant/menus";
  };

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "macchiato";
      hide_quick_activation = true;
      providers = {
        default = [
          "desktopapplications"
          "calc"
          "clipboard"
        ];
      };
    };
  };
}
