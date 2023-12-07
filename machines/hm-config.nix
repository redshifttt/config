{ inputs, pkgs, home-manager, ... }:
let
  buildhmConfig = hostName:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./${hostName}/home.nix ];
      extraSpecialArgs = { inherit inputs; };
    };
in {
  "sean@minotaur" = buildhmConfig "minotaur";
  "sean@ceres" = buildhmConfig "ceres";
}
