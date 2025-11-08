{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    packages = with pkgs; [
      cargo
      chezmoi
      fastfetch
      fd
      fzf
      gcc
      gh
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
  };

  services = {
    cliphist.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
    swaync.enable = true;
  };

  programs = {
    swaylock.enable = true;
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
    };
  };

  home.file = {
    ".tmux.conf".source = ./configs/tmux.conf;
    ".zshrc".source = ./configs/zshrc;
  };

  xdg.configFile = {
    "cliphist".source = ./configs/cliphist;
    "hypr".source = ./configs/hypr;
    "kitty".source = ./configs/kitty;
    "nvim".source = ./configs/nvim;
    "rofi".source = ./configs/rofi;
    "swaylock/config".source = ./configs/swaylock/config;
    "swaync".source = ./configs/swaync;
    "waybar".source = ./configs/waybar;
  };
}
