{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };

    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(meta, esc)";
              leftalt = "leftcontrol";
              leftmeta = "leftalt";
              leftcontrol = "layer(arrows)";
            };
            "arrows:C" = {
              h = "left";
              j = "down";
              k = "up";
              l = "right";
            };
          };
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    libinput.enable = true;
    printing.enable = true;
  };

  security = {
    rtkit.enable = true;
  };

  users.users.danny = {
    isNormalUser = true;
    description = "Danny Rosenthal";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    wl-clipboard
    unzip
    neovim
    kitty
    vim
    chezmoi
    wget
    fzf

    hyprpolkitagent
    hyprpaper
    nerd-fonts.jetbrains-mono
    rofi

    gh
    python314
    go
    nodejs
    lazygit

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

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  programs = {
    nix-ld.enable = true;
    firefox.enable = true;
    waybar.enable = true;
    _1password-gui.enable = true;
    git.enable = true;
    zsh.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.hypridle.enable = true;
  services.flatpak.enable = true;

  system.stateVersion = "25.05";
}
