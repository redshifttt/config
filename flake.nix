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
        modules = [ ./home ];
        extraSpecialArgs = { inherit inputs; };
      };
      "sean@ceres" = hmConfig {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = { inherit inputs; };
      };
    };

    packages.${system} = {
      LS_COLORS = pkgs.callPackage ./packages/ls_colors {};
      local-scripts = pkgs.callPackage ./packages/local-scripts {};
      firefox-addons = pkgs.callPackage ./packages/firefox-addons {};
    } // import ./packages/patched.nix { inherit pkgs; };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        gnumake
      ];
    };
  };
}
