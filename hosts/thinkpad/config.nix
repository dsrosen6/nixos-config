{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common.nix
    ../../nixos/pkgs.nix
    ../../nixos/keyd.nix
    ../../nixos/gnome.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
