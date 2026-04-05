{ pkgs, ... }:
let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "teal";
  };
in
{
  home.packages = with pkgs; [
    bibata-cursors
    libsForQt5.qt5ct
    kdePackages.qt6ct
    catppuccin-kvantum
    kdePackages.qtstyleplugin-kvantum
    magnetic-catppuccin-gtk

    (catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "teal";
    })
  ];

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
