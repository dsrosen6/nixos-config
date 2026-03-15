{ pkgs, ... }:
let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    accent = "teal";
    variant = "mocha";
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
      package = pkgs.papirus-icon-theme;
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
}
