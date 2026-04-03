{
  description = "NixOS Config";
  inputs = {
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    claude-code.url = "github:sadjow/claude-code-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      catppuccin,
      claude-code,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/thinkpad/config.nix
            home-manager.nixosModules.home-manager

            {
              home-manager.extraSpecialArgs = {
                dotfiles = ./dotfiles;
              };
              nixpkgs.overlays = [ claude-code.overlays.default ];
              home-manager.sharedModules = [
                catppuccin.homeModules.catppuccin
              ];
            }
          ];
        };
      };
    };
}
