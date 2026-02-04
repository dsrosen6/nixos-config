{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    killall
    linuxPackages.cpupower
    unzip
    wget
    wl-clipboard
  ];
}
