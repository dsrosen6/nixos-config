{
  pkgs,
  pkgs-unstable,
  dotfiles,
  ...
}:
{
  imports = [
    ./modules/hyprland/hypr.nix
    ./modules/1password.nix
    ./modules/ghostty.nix
    ./modules/go.nix
    ./modules/theme.nix
    ./modules/tmux.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
  ];

  home = {
    username = "danny";
    homeDirectory = "/home/danny";
    stateVersion = "25.05";

    sessionVariables = {
      PATH = "$HOME/bin:$GOPATH/bin:$PATH";
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      brightnessctl
      btop
      cargo
      fastfetch
      fd
      fzf
      gcc
      gh
      gnumake
      hyprpicker
      jq
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
      vim
      pkgs-unstable.zoom-us
      pkgs-unstable.claude-code
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
    "scripts".source = "${dotfiles}/scripts";
  };
}
