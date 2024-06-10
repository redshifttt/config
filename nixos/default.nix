{ inputs, nixpkgs, system, nixos-hardware, home-manager }:
let
  buildnixosSystem = modules:
    nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [] ++ modules; # Maybe how you do it? Seems to work.
      specialArgs = { inherit inputs; };
    };
in {
  minotaur = buildnixosSystem [
    ./minotaur
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-gpu-amd
  ];
  ceres = buildnixosSystem [
    ./ceres
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-gpu-amd
  ];
}
