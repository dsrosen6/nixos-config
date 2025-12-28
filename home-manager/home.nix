{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  dotfiles = ../dotfiles;
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
      pkgs-unstable.claude-code
      fastfetch
      fd
      fzf
      gcc
      gh
      gnumake
      grim
      kitty
      lazygit
      lua
      luarocks
      neovim
      nerd-fonts.jetbrains-mono
      niv
      nixfmt-rfc-style
      nodejs
      obsidian
      pavucontrol
      playerctl
      python314
      ripgrep
      slurp
      spotify
      statix
      swaylock
      vim
    ];
  };

  services = {
    hyprlaptop.enable = true;
    cliphist.enable = true;
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
    swaylock.enable = true;

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
    "swaylock/config".source = "${dotfiles}/swaylock/config";
    "swaync".source = "${dotfiles}/swaync";
  };
}
