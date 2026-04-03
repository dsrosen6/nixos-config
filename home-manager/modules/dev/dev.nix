{
  pkgs,
  ...
}:
{
  imports = [
    ./ghostty.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOPROXY = "https://proxy.golang.org,direct";
  };

  home.packages = with pkgs; [
    # General dev/terminal stuff
    cargo
    fd
    fzf
    gcc
    gh
    jq
    kitty
    lua
    luarocks
    neovim
    python314
    ripgrep
    statix
    vim
    claude-code

    # Go and related packages
    go_1_26
    go-tools
    goose
    gopls
    sqlc
  ];

  programs = {
    fzf.enable = true;
    lazygit.enable = true;
    zoxide.enable = true;

    git = {
      enable = true;
      settings = {
        user.name = "Danny Rosenthal";
        user.email = "dsrosen6@gmail.com";
      };
    };
  };
}
