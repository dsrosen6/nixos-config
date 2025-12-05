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
  };

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "macchiato";
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
