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
  in {
    nixosConfigurations = import ./nixos { inherit inputs nixpkgs system nixos-hardware; };
    homeConfigurations = import ./home_manager { inherit inputs pkgs home-manager; };

    packages.${system} = import ./packages { inherit pkgs; };

    templates.python-devshell = {
      path = ./templates/python-devshell;
      description = "A basic Python devshell";
    };
  };
}
