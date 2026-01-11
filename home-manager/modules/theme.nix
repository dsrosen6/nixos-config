{ pkgs, ... }:
let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    accent = "teal";
    variant = "macchiato";
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
        tweaks = [ "macchiato" ];
      };
      name = "Catppuccin-GTK-Dark-Macchiato";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
