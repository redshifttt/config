{ inputs, system }:
let
  buildnixosSystem = modules:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [] ++ modules; # Maybe how you do it? Seems to work.
      specialArgs = { inherit inputs; };
    };
in {
  minotaur = buildnixosSystem [
    ./minotaur
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];
  ceres = buildnixosSystem [
    ./ceres
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];
}
