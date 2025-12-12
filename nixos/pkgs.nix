{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
    killall
    linuxPackages.cpupower
    unzip
    wget
    wl-clipboard
  ];
}
