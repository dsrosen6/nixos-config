{ pkgs, ... }:
let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "teal";
  };
in
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    catppuccin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.magnetic-catppuccin-gtk.override {
      };
      name = "Catppuccin-GTK-Dark";
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "teal";
      };
      name = "Papirus";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  catppuccin = {
    accent = "teal";
    flavor = "mocha";

    fzf.enable = true;
    ghostty.enable = true;
    lazygit.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zsh-syntax-highlighting.enable = true;

    # this doesn't seem to work, oh well
    firefox = {
      enable = true;
      force = true;
    };
  };
}
