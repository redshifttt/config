{ inputs, pkgs, home-manager, ... }:
let
  buildHomeManagerConfig = { modules ? [ ] }:
    home-manager.lib.homeManagerConfiguration {
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
