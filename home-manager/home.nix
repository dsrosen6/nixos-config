{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  dotfiles = ../dotfiles;
  wallpaper = ../dotfiles/wallpapers/windwaker-island.jpg;
in
{
  imports = [
    ./modules/1password.nix
    ./modules/ghostty.nix
    ./modules/go.nix
    ./modules/hypr.nix
    ./modules/swappy.nix
    ./modules/theme.nix
    ./modules/tmux.nix
    ./modules/walker.nix
    ./modules/waybar.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
    inputs.hyprlaptop.homeManagerModules.default
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
      cargo
      fastfetch
      fd
      fzf
      gcc
      gh
      gnumake
      grim
      hyprpicker
      jq
      kitty
      lazygit
      lua
      luarocks
      neovim
      nerd-fonts.jetbrains-mono
      niv
      nixfmt-rfc-style
      obsidian
      pavucontrol
      playerctl
      python314
      ripgrep
      slurp
      spotify
      statix
      vim

      pkgs-unstable.claude-code
    ];
  };

  services = {
    cliphist.enable = true;
    hyprlaptop.enable = true;
    swaync.enable = true;
    swayosd.enable = true;
    easyeffects = {
      enable = true;
      preset = "thinkpad";
    };
  };

  programs = {
    zoxide.enable = true;
    firefox.enable = true;

    git = {
      enable = true;
      settings = {
        user.name = "Danny Rosenthal";
        user.email = "dsrosen6@gmail.com";
      };
    };

  };

  xdg.configFile = {
    "easyeffects/output/thinkpad.json".source = "${dotfiles}/easyeffects/thinkpad.json";
    "swaync".source = "${dotfiles}/swaync";
    "scripts".source = "${dotfiles}/scripts";
  };

  home.file.".config/background".source = wallpaper;
}
