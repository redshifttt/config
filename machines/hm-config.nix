{ inputs, pkgs, home-manager, ... }:
let
  buildhmConfig = hostName:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./${hostName}/home.nix ];
      extraSpecialArgs = { inherit inputs; };
    };
in {
  "sean@vesta" = buildhmConfig "vesta";
  "sean@ceres" = buildhmConfig "ceres";
}
