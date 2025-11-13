{ lib, pkgs, ... }:
{
  imports = [
    ./configs/zsh.nix
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.magnetic-catppuccin-gtk.override {
        tweaks = [ "macchiato" ];
      };
      name = "Catppuccin-GTK-Dark-Macchiato";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "nvim";
      GOPATH = "$HOME/go";
      PATH = "$HOME/bin:$GOPATH/bin:$PATH";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;

    };

    packages = with pkgs; [
      brightnessctl
      cargo
      chezmoi
      fastfetch
      fd
      fzf
      gcc
      gh
      ghostty
      go
      gobject-introspection
      jetbrains.goland
      kitty
      lazygit
      lf
      lua
      luarocks
      neovim
      nerd-fonts.jetbrains-mono
      nixfmt-rfc-style
      nodejs
      pavucontrol
      playerctl
      python314
      ripgrep
      rofi
      spotify
      statix
      swaylock
      tmux
      vim
    ];

    activation.linkConfigs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ln -sfn ~/nixos/configs/nvim ~/.config/nvim
      ln -sfn ~/nixos/configs/waybar ~/.config/waybar
      ln -sfn ~/nixos/configs/hypr ~/.config/hypr
    '';
  };

  services = {
    cliphist.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
    swaync.enable = true;
    swayosd.enable = true;
    easyeffects = {
      enable = true;
      preset = "thinkpad";
    };
  };

  programs = {
    swaylock.enable = true;
    firefox.enable = true;
    waybar.enable = true;

    git = {
      enable = true;
      extraConfig = {
        user.name = "Danny Rosenthal";
        user.email = "dsrosen6@gmail.com";
      };
    };
  };

  home.file = {
    ".tmux.conf".source = ./configs/tmux.conf;
  };

  xdg.configFile = {
    "cliphist".source = ./configs/cliphist;
    "easyeffects/output/thinkpad.json".source = ./configs/easyeffects/thinkpad.json;
    "ghostty".source = ./configs/ghostty;
    "kitty".source = ./configs/kitty;
    "rofi".source = ./configs/rofi;
    "swaylock/config".source = ./configs/swaylock/config;
    "swaync".source = ./configs/swaync;
  };
}
