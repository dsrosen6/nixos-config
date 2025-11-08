{ pkgs, ... }:
{
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
      playerctl
      spotify
      gh
      python314
      gobject-introspection
      go
      nodejs
      lazygit
      jetbrains.goland
      swaylock
      rofi
      chezmoi
      neovim
      vim
      fzf
      kitty
      nerd-fonts.jetbrains-mono
      cargo
      nixfmt-rfc-style
      statix
      gcc
      tmux
      ripgrep
      luarocks
      fd
      lua
    ];
  };

  services = {
    cliphist.enable = true;
    swaync.enable = true;
    hyprpolkitagent.enable = true;
    hypridle.enable = true;
    hyprpaper.enable = true;
    hyprsunset.enable = true;
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
    ".zshrc".source = ./configs/zshrc;
  };

  xdg.configFile = {
    "kitty".source = ./configs/kitty;
    "nvim".source = ./configs/nvim;
    "hypr".source = ./configs/hypr;
    "cliphist".source = ./configs/cliphist;
    "rofi".source = ./configs/rofi;
    "waybar".source = ./configs/waybar;
    "swaync".source = ./configs/swaync;
    "swaylock/config".source = ./configs/swaylock/config;
  };
}
