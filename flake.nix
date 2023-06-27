{
  description = "redshift's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nil.url = "github:oxalica/nil";
  };

  outputs = { self, nixpkgs, hm, nur, ... } @ inputs: {
    nixosConfigurations = {
      vesta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vesta/configuration.nix

          hm.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sean = import ./home;
            };
            nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];
          }
        ];
      };
    };
  };
}
