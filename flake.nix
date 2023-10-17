{
  description = "redshift's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
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

    nixosSystem = nixpkgs.lib.nixosSystem;
    hmConfig = home-manager.lib.homeManagerConfiguration;
  in
  {
    nixosConfigurations = {
      vesta = nixosSystem {
        inherit system;
        modules = [
          ./hosts/vesta

          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
        ];
        specialArgs = { inherit inputs; };
      };
      ceres = nixosSystem {
        inherit system;
        modules = [
          ./hosts/ceres/configuration.nix

          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
        ];
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      "sean@vesta" = hmConfig {
        inherit pkgs;
        modules = [ ./hosts/vesta/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
      "sean@ceres" = hmConfig {
        inherit pkgs;
        modules = [ ./hosts/ceres/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };

    packages.${system} = import ./packages { inherit pkgs; };

    templates.python-devshell = {
      path = ./templates/python-devshell;
      description = "A basic Python devshell";
    };
  };
}
