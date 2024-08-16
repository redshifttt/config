{ pkgs, inputs, ... }:

let
  modifierKey = "Mod4";
  workspace1 = "1";
  workspace2 = "2";
  workspace3 = "3";
  workspace4 = "4";
  workspace5 = "5";
in {
  imports = [ ./i3blocks.nix ];

  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      for_window [class="[Qq]alculate-gtk"] floating enable
    '';

    config = {
      modifier = modifierKey;
      defaultWorkspace = "workspace \"${workspace1}\"";

      floating.modifier = modifierKey;
      focus = {
        followMouse = false;
        newWindow = "focus";
      };

      window = {
        border = 2;
        titlebar = false;
      };

      colors.background = "#000000";

      fonts = {
        names = ["Cantarell"];
        size = 11.0;
      };

      keybindings = {
        # "XF86AudioMute" = "";
        # "XF86AudioRaiseVolume" = "";
        # "XF86AudioLowerVolume" = "";

        "${modifierKey}+r" = "exec --no-startup-id \"${pkgs.i3}/bin/i3-msg restart\"";
        "${modifierKey}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifierKey}+w" = "kill";
        "${modifierKey}+d" = "exec --no-startup-id \"${pkgs.bemenu}/bin/bemenu-run -c -W 0.2 -l20 -s -C -T -i -B 2 -M 20 --counter always -p 'open' --cw 1 --fn 'Liberation Mono 11'\"";
        "${modifierKey}+s" = "exec --no-startup-id \"${inputs.self.packages.x86_64-linux.local-scripts.scrot}/bin/scrot\"";
        "${modifierKey}+Delete" = "exec --no-startup-id systemctl suspend";

        "${modifierKey}+h" = "focus left";
        "${modifierKey}+Shift+h" = "move left";

        "${modifierKey}+j" = "focus down";
        "${modifierKey}+Shift+j" = "move down";

        "${modifierKey}+k" = "focus up";
        "${modifierKey}+Shift+k" = "move up";

        "${modifierKey}+l" = "focus right";
        "${modifierKey}+Shift+l" = "move right";

        "${modifierKey}+f" = "fullscreen toggle";
        "${modifierKey}+space" = "floating toggle";
        "${modifierKey}+1" = "workspace \"${workspace1}\"";
        "${modifierKey}+2" = "workspace \"${workspace2}\"";
        "${modifierKey}+3" = "workspace \"${workspace3}\"";
        "${modifierKey}+4" = "workspace \"${workspace4}\"";
        "${modifierKey}+5" = "workspace \"${workspace5}\"";
        "${modifierKey}+6" = "workspace back_and_forth";
        "${modifierKey}+Shift+1" = "move container to workspace number \"${workspace1}\"; workspace \"${workspace1}\"";
        "${modifierKey}+Shift+2" = "move container to workspace number \"${workspace2}\"; workspace \"${workspace2}\"";
        "${modifierKey}+Shift+3" = "move container to workspace number \"${workspace3}\"; workspace \"${workspace3}\"";
        "${modifierKey}+Shift+4" = "move container to workspace number \"${workspace4}\"; workspace \"${workspace4}\"";
        "${modifierKey}+Shift+5" = "move container to workspace number \"${workspace5}\"; workspace \"${workspace5}\"";
      };

      bars = [
        {
          fonts = {
            names = ["Cantarell Bold"];
            size = 12.0;
          };
          # statusCommand = "";
          command = "${pkgs.polybar}/bin/polybar";
          position = "top";
          workspaceButtons = true;
          workspaceNumbers = true;
        }
      ];

      startup = [
        { command = "${pkgs.networkmanagerapplet}/bin/nm-applet"; }
        { command = "${pkgs.dunst}/bin/dunst"; }
        { command = "${pkgs.volctl}/bin/volctl"; }
        { command = "${pkgs.xwallpaper}/bin/xwallpaper --zoom ./painting1.jpg"; }
      ];
    };
  };
}
