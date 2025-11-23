{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
    killall
    unzip
    wget
    wl-clipboard
  ];
}
