{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    killall
    unzip
    wget
  ];
}
