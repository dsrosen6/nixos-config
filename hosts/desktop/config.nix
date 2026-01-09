{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common.nix
    ../../nixos/pkgs.nix
    ../../nixos/keyd.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;
    lact.enable = true;
  };

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    protontricks
    p7zip
    zenity
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
