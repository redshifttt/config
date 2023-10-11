{ pkgs, stdenv, ... }:

let
  buildFirefoxAddon = { pname, extID, guid, hash }:
    stdenv.mkDerivation {
      inherit pname;
      version = "latest";
      src = pkgs.fetchurl {
        url = "https://addons.mozilla.org/firefox/downloads/file/${extID}";
        inherit hash;
      };

      dontUnpack = true;
      preferLocalBuild = true;
      allowSubstitutes = true;

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${guid}"
      '';
    };
in {
  ublock-origin = buildFirefoxAddon {
    pname = "ublock_origin";
    extID = "4141256";
    guid = "uBlock0@raymondhill.net.xpi";
    hash = "sha256-i3NGi8IzoR3SiVIZRmOBeD0ZEjhX3Qtv0WoBgg/KSDQ=";
  };
  violentmonkey = buildFirefoxAddon {
    pname = "violentmonkey";
    extID = "4142251";
    guid = "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}";
    hash = "sha256-iU5Uy+nc0jXervBUuSaKlV/tmv7hVuvUIknCsWHFU1I=";
  };
  bitwarden = buildFirefoxAddon {
    pname = "bitwarden";
    extID = "4140393";
    guid = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    hash = "sha256-ozlx2A9VInn5ZXl4aTiujojEuVwp+DOcQvXeR/FSAK0=";
  };
  darkreader = buildFirefoxAddon {
    pname = "darkreader";
    extID = "4172671";
    guid = "addon@darkreader.org";
    hash = "sha256-ILUzVsNrDHbfYU4suE5/8+GrdbT+L9K7ygOQJtAYgT8=";
  };
}
