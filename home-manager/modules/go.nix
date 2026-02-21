{ pkgs, ... }:
{
  # Go dev-related variables and packages
  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOPROXY = "https://proxy.golang.org,direct";
  };

  home.packages = with pkgs; [
    go_1_26
    go-tools
    goose
    gopls
    jetbrains.goland
    sqlc
  ];
}
