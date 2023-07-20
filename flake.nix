{
  description = "redshift's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nil.url = "github:oxalica/nil";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      vesta = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/vesta/configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      "sean@vesta" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = { inherit inputs; };
      };
    };

    packages.${system} = {
      LS_COLORS = pkgs.callPackage ./packages/ls_colors {};
      local-scripts = pkgs.callPackage ./bin {};
    };
  };
}
