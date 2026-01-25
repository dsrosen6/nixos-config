{
  description = "NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
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
                inherit inputs pkgs-unstable system;
                dotfiles = ./dotfiles;
              };
            }
          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules = [
            ./hosts/desktop/config.nix
            home-manager.nixosModules.home-manager

            {
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable system;
                dotfiles = ./dotfiles;
              };
            }
          ];
        };
      };
    };
}
