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
    ./modules/cliphist.nix
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
      chromium
      discord
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
      pkgs-unstable.claude-code

      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu-sans
      ubuntu-sans
    ];
  };

  services = {
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
    "colors".source = "${dotfiles}/colors";
  };
}
