{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common.nix
    ../../nixos/pkgs.nix
    ../../nixos/keyd.nix
  ];

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
