{
  pkgs,
  dotfiles,
  ...
}:
{
  imports = [
    ./modules/1password.nix
    ./modules/cliphist.nix
    ./modules/theme.nix
    ./modules/yazi.nix

    ./modules/dev/dev.nix
    ./modules/hyprland/hypr.nix
  ];

  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    sessionVariables = {
      PATH = "$HOME/bin:$GOPATH/bin:$PATH";
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      brightnessctl
      btop
      chromium
      discord
      fastfetch
      gnumake
      hyprpicker
      libnotify
      niv
      nixfmt-rfc-style
      nodejs
      obsidian
      pavucontrol
      playerctl
      spotify

      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu-sans
      ubuntu-sans
    ];
  };

  services = {
    swaync.enable = true;
    swayosd.enable = true;
    easyeffects.enable = true;
  };

  programs = {
    firefox.enable = true;
  };

  xdg.configFile = {
    "colors".source = "${dotfiles}/colors";
    "easyeffects/output".source = "${dotfiles}/easyeffects";
    "scripts".source = "${dotfiles}/scripts";
  };
}
