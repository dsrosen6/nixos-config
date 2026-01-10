{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common.nix
    ../../nixos/pkgs.nix
    ../../nixos/keyd.nix
    ../../nixos/plasma.nix
    ../../nixos/gaming.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
