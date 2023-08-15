{ pkgs, lib, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles."default" = {
      name = "default";
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        force = true;
        order = [ "DuckDuckGo" ];
        # TODO: refactor the below to be more dynamic.
        engines = {
          "DuckDuckGo" = {
            urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
          };
          "Google".metaData.hidden = true;
          "Amazon.co.uk".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
      extraConfig = let
        arkenfox = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js";
          hash = "sha256-sysEtq4aEWmkKy3KPe+4J/HJxjCxNcTAzptZ7s5JrJg=";
        };
      in ''
      ${lib.strings.fileContents arkenfox}

      // ffprofile additions -- may contain duplicates
      ${lib.strings.fileContents ./ffprofile.js}
      '';
      extensions = with inputs.self.packages.x86_64-linux.firefox-addons; [
        ublock-origin
        violentmonkey
        bitwarden
      ];
    };
  };
}
