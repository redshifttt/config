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

    buildnixosSystem = modules:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [] ++ modules; # Maybe how you do it? Seems to work.
        specialArgs = { inherit inputs; };
      };

    buildhmConfig = hostName:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/${hostName}/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
  in {
    nixosConfigurations = {
      vesta = buildnixosSystem [
        ./hosts/vesta
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-gpu-amd
      ];
      ceres = buildnixosSystem [
        ./hosts/ceres
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-gpu-amd
      ];
    };

    homeConfigurations = {
      "sean@vesta" = buildhmConfig "vesta";
      "sean@ceres" = buildhmConfig "ceres";
    };

    packages.${system} = import ./packages { inherit pkgs; };

    templates.python-devshell = {
      path = ./templates/python-devshell;
      description = "A basic Python devshell";
    };
  };
}
