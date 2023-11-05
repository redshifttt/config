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
        };
      };
      extraConfig = let
        arkenfox = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js";
          hash = "sha256-rWFgnARpraFfuuw6dkWlcoofct1PLFto5rqcbflgQPE=";
        };
        in ''
        ${lib.strings.fileContents arkenfox}

        // custom arkenfox changes
        /// disable safe browsing (sends urls to google)
        user_pref("browser.safebrowsing.malware.enabled", false);
        user_pref("browser.safebrowsing.phishing.enabled", false);
        user_pref("browser.safebrowsing.downloads.enabled", false);
        user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
        user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
        /// disable DoH
        user_pref("network.trr.mode", 5);
        user_pref("network.trr.uri", "");
        user_pref("network.trr.custom_uri", "");
        /// enable webgl so everything doesnt fucking break
        user_pref("webgl.disabled", false);

        // not in arkenfox
        user_pref("extensions.pocket.enabled", false);
        user_pref("browser.urlbar.suggest.enabled", false);
        '';
      extensions = with inputs.self.packages.x86_64-linux.firefox-addons; [
        ublock-origin
        violentmonkey
        bitwarden
        darkreader
      ];
    };
  };
}
