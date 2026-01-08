{ ... }:
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

  programs.steam.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.danny = import ../../home-manager/home.nix;
  };
}
