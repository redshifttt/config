{
  description = "redshift's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nil.url = "github:oxalica/nil";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... } @ inputs: {
    nixosConfigurations = {
      vesta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/vesta/configuration.nix ];
      };
    };

    homeConfigurations = {
      "sean@vesta" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home ];
      };
    };
  };
}
