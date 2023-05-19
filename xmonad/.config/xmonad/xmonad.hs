import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main :: IO ()
main =
    xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ myConfig

myTerminal = "alacritty"
myBorderWidth = 2

myConfig = def {
        terminal = myTerminal
        , modMask = mod4Mask
        , borderWidth = myBorderWidth
        , layoutHook = myLayout
    }
    `additionalKeysP`
    [
        ("M-s", unGrab *> spawn "scrot -s")
        , ("M-d", unGrab *> spawn "bemenu-run -c -W 0.2 -l20 -s -CT -p 'run'")
        -- , ("M-Delete", unGrab *> spawn "actions")
    ]


myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
        tiled   = Tall nmaster delta ratio
        nmaster = 1      -- Default number of windows in the master pane
        ratio   = 1/2    -- Default proportion of screen occupied by master pane
        delta   = 3/100  -- Percent of screen to increment by when resizing panes

