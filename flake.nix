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

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... } @ inputs:
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
            inputs.nixos-hardware.nixosModules.common-cpu-amd
            inputs.nixos-hardware.nixosModules.common-gpu-amd
          ];
          specialArgs = { inherit inputs; };
        };

        ceres = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/ceres
            inputs.nixos-hardware.nixosModules.common-cpu-amd
            inputs.nixos-hardware.nixosModules.common-gpu-amd
          ];
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations = {
        "sean@minotaur" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/sean/minotaur.nix ./home/sean/profiles/cli ./home/sean/profiles/gui ./home/sean/profiles/xdg ];
          extraSpecialArgs = { inherit inputs; };
        };
        "sean@ceres" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/sean/ceres.nix ./home/sean/profiles/cli ./home/sean/profiles/gui ./home/sean/profiles/xdg ];
          extraSpecialArgs = { inherit inputs; };
        };
      };

      packages.${system} = import ./packages { inherit pkgs; };
  };
}
