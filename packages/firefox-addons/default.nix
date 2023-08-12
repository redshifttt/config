{ pkgs, stdenv, ... }:

# let
#   buildFirefoxXpiAddon = pname: version: src: guid:
#     stdenv.mkDerivation {
#       inherit pname;
#       inherit version;
#       inherit src;
#
#       dontUnpack = true;
#       preferLocalBuild = true;
#       allowSubstitutes = true;
#
#       buildCommand = ''
#       dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
#       mkdir -p "$dst"
#       install -v -m644 "$src" "$dst/${guid}.xpi"
#       '';
#     };
# in
{
  ublock-origin = stdenv.mkDerivation rec {
    pname = "ublock_origin";
    version = "1.51.0";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4141256/${pname}-${version}.xpi";
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
  violentmonkey = stdenv.mkDerivation rec {
    pname = "violentmonkey";
    version = "2.15.0";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4142251/${pname}-${version}.xpi";
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
  bitwarden = stdenv.mkDerivation rec {
    pname = "bitwarden_password_manager";
    version = "2023.7.1";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4140393/${pname}-${version}.xpi";
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
  stylus = stdenv.mkDerivation rec {
    pname = "styl_us";
    version = "1.5.33";
    src = pkgs.fetchurl {
      url = "https://addons.mozilla.org/firefox/downloads/file/4114817/${pname}-${version}.xpi";
      hash = "sha256-1rjMH00Jhv+hF5mQZetbuLVZYTaqYMuf90YHNlZwSCI=";
    };

    dontUnpack = true;
    preferLocalBuild = true;
    allowSubstitutes = true;

    buildCommand = ''
    dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
    mkdir -p "$dst"
    install -v -m644 "$src" "$dst/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi"
    '';
  };
}
