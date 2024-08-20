{
  description = "sean's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        minotaur = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/minotaur

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.sean = import ./home/sean/minotaur.nix;
            }
          ];
          specialArgs = { inherit inputs; };
        };

        ceres = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/ceres

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.sean = import ./home/sean/ceres.nix;
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };

      packages.${system} = import ./packages { inherit pkgs; };
    };
}
