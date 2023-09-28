{ pkgs, stdenv, ... }:

{
  ublock-origin = stdenv.mkDerivation {
    pname = "ublock_origin";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4141256";
      hash = "sha256-i3NGi8IzoR3SiVIZRmOBeD0ZEjhX3Qtv0WoBgg/KSDQ=";
    };

    dontUnpack = true;
    preferLocalBuild = true;
    allowSubstitutes = true;

    buildCommand = ''
      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p "$dst"
      install -v -m644 "$src" "$dst/uBlock0@raymondhill.net.xpi"
    '';
  };
  violentmonkey = stdenv.mkDerivation {
    pname = "violentmonkey";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4142251";
      hash = "sha256-iU5Uy+nc0jXervBUuSaKlV/tmv7hVuvUIknCsWHFU1I=";
    };

    dontUnpack = true;
    preferLocalBuild = true;
    allowSubstitutes = true;

    buildCommand = ''
      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p "$dst"
      install -v -m644 "$src" "$dst/{aecec67f-0d10-4fa7-b7c7-609a2db280cf}.xpi"
    '';
  };
  bitwarden = stdenv.mkDerivation {
    pname = "bitwarden";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4140393";
      hash = "sha256-ozlx2A9VInn5ZXl4aTiujojEuVwp+DOcQvXeR/FSAK0=";
    };

    dontUnpack = true;
    preferLocalBuild = true;
    allowSubstitutes = true;

    buildCommand = ''
      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p "$dst"
      install -v -m644 "$src" "$dst/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
    '';
  };
  darkreader = stdenv.mkDerivation {
    pname = "darkreader";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4172671";
      hash = "sha256-ILUzVsNrDHbfYU4suE5/8+GrdbT+L9K7ygOQJtAYgT8=";
    };

    dontUnpack = true;
    preferLocalBuild = true;
    allowSubstitutes = true;

    buildCommand = ''
      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p "$dst"
      install -v -m644 "$src" "$dst/addon@darkreader.org.xpi"
    '';
  };
}
