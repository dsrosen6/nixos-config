{ pkgs, ... }:
{
  # Go dev-related variables and packages
  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOPROXY = "https://proxy.golang.org,direct";
  };

  home.packages = with pkgs; [
    go
    go-tools
    goose
    gopls
    jetbrains.goland
    sqlc
  ];
}
