{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
