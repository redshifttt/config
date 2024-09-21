{ pkgs, ... }:

pkgs.buildGoModule {
  pname = "go-fts";
  version = "0.0.0";
  src = ./.;
  vendorHash = "sha256-hnZbE9aJMmey8JNTr67JueVpGXPisRUtxhNO1qsYSKw=";
}
