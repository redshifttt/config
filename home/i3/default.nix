{
  config,
  pkgs,
  lib,
  ...
}: let
  modifierKey = "Mod4";
  workspace1 = "1 main";
  workspace2 = "2 code";
  workspace3 = "3 music";
  workspace4 = "4 vidya";
  workspace5 = "5 other";
in {
  xsession.windowManager.i3 = {
    enable = true;

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

      fonts = {
        names = ["Cantarell"];
        size = 11.0;
      };

      keybindings = lib.mkOptionDefault {
        "${modifierKey}+r" = "exec --no-startup-id \"${pkgs.i3}/bin/i3-msg restart\"";
        "${modifierKey}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifierKey}+w" = "kill";
        "${modifierKey}+d" = "exec --no-startup-id \"${pkgs.bemenu}/bin/bemenu-run -c -W 0.2 -l20 -s -CT -p 'run'\"";
        #"${modifierKey}+s" = "exec --no-startup-id \"scrot -s\"";
        #"${modifierKey}+Delete" = "exec --no-startup-id \"actions\"";

        "${modifierKey}+h" = "focus left";
        "${modifierKey}+j" = "focus down";
        "${modifierKey}+k" = "focus up";
        "${modifierKey}+l" = "focus right";
        "${modifierKey}+Shift+h" = "move left";
        "${modifierKey}+Shift+j" = "move down";
        "${modifierKey}+Shift+k" = "move up";
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
            names = ["Cantarell"];
            size = 11.0;
          };
          position = "top";
          statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c ${./i3blocks/config}";
          colors = {
            background = "#080A0E";
            focusedWorkspace = {
              background = "#232937";
              border = "#232937";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              background = "#191d27";
              border = "#232937";
              text = "#666666";
            };
            urgentWorkspace = {
              background = "#ec5959";
              border = "#ffffff";
              text = "#ffffff";
            };
          };
          trayPadding = 4;
          workspaceButtons = true;
          workspaceNumbers = true;
        }
      ];

      startup = [
        {
          command = "nm-applet";
          always = false;
          notification = false;
        }
        {
          command = "dunst";
          always = false;
          notification = false;
        }
        {
          command = "picom";
          always = false;
          notification = false;
        }
        #{ command = "xwallpaper ..."; always = false; notification = false; }
      ];
    };
  };
}
