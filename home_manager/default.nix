{ inputs, pkgs }:
let
  buildHomeManagerConfig = { modules ? [ ] }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      inherit modules;
      extraSpecialArgs = { inherit inputs; };
    };
in {
  "sean@minotaur" = buildHomeManagerConfig {
    modules = [ ./minotaur.nix ];
  };
  "sean@ceres" = buildHomeManagerConfig {
    modules = [ ./ceres.nix ];
  };
}
