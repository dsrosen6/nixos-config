{ lib, pkgs, ... }:
let
  dotfiles = ../../dotfiles;
in
{
  imports = [
    ./ghostty.nix
    ./tmux.nix
    ./waybar/config.nix
    ./zsh.nix
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
      btop
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
      sqlc
      statix
      swaylock
      vim
    ];

    activation.linkconfigs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ln -sfn ${dotfiles}/nvim ~/.config/nvim
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
    kanshi = {
      enable = false;
      systemdTarget = "xdg-desktop-portal-hyprland.service";
      settings = [
        {
          profile = {
            name = "docked";
            outputs = [
              {
                criteria = "eDP-1";
                status = "disable";
              }
              {
                criteria = "DP-1";
                position = "0,0";
              }
            ];
          };
        }
        {
          profile = {
            name = "undocked";
            outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
                position = "0,0";
              }
            ];
          };
        }
      ];
    };
  };

  programs = {
    zoxide.enable = true;
    firefox.enable = true;
    swaylock.enable = true;
    yazi.enable = true;

    git = {
      enable = true;
      extraConfig = {
        user.name = "Danny Rosenthal";
        user.email = "dsrosen6@gmail.com";
      };
    };

  };

  xdg.configFile = {
    "cliphist".source = "${dotfiles}/cliphist";
    "hypr".source = "${dotfiles}/hypr";
    "easyeffects/output/thinkpad.json".source = "${dotfiles}/easyeffects/thinkpad.json";
    "rofi".source = "${dotfiles}/rofi";
    "swaylock/config".source = "${dotfiles}/swaylock/config";
    "swaync".source = "${dotfiles}/swaync";
  };
}
