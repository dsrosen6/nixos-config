{
  description = "NixOS Config";
  inputs = {
    hyprlaptop.url = "github:dsrosen6/hyprlaptop";
    elephant.url = "github:abenz1267/elephant";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      hyprlaptop,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs-unstable; };
          modules = [
            ./hosts/thinkpad/config.nix
            home-manager.nixosModules.home-manager

            {
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable;
              };
            }
          ];
        };
      };
    };
}
