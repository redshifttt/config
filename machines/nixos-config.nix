{ inputs, nixpkgs, system, nixos-hardware }:
let
  buildnixosSystem = modules:
    nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [] ++ modules; # Maybe how you do it? Seems to work.
      specialArgs = { inherit inputs; };
    };
in {
  vesta = buildnixosSystem [
    ./vesta
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-gpu-amd
  ];
  ceres = buildnixosSystem [
    ./ceres
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-gpu-amd
  ];
}
