{ pkgs, ... }:

pkgs.buildGoModule {
  pname = "go-fts";
  version = "0.0.0";
  src = ./.;
  vendorHash = "sha256-ZUP2SRHup5GSlzrIec6TvF8qFKyqlMAA7/SNJXcyITs=";
}
