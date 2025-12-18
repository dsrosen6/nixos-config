{ pkgs, ... }:
let
  dotfiles = ../dotfiles;
in
{
  imports = [
    ./modules/1password.nix
    ./modules/ghostty.nix
    ./modules/go.nix
    ./modules/hypr.nix
    ./modules/theme.nix
    ./modules/tmux.nix
    ./modules/walker.nix
    ./modules/waybar.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
  ];

  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    sessionVariables = {
      PATH = "$HOME/bin:$GOPATH/bin:$PATH";
    };

    packages = with pkgs; [
      brightnessctl
      btop
      cargo
      claude-code
      fastfetch
      fd
      fzf
      gcc
      gh
      grimblast
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
      spotify
      statix
      swaylock
      vim
    ];
  };

  services = {
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
