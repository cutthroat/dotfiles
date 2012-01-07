import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Themes
import XMonad.Util.EZConfig

myLayouts = avoidStruts $ smartBorders $ tiled ||| Mirror tiled ||| noBorders Full ||| tabbed shrinkText (theme smallClean) 
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

myManageHooks = maybeToDefinite (isFullscreen -?> doFullFloat)

myConfig = defaultConfig
    { layoutHook = myLayouts

    , terminal = "xterm"

    , borderWidth = 2
    , normalBorderColor = "#333333"
    , focusedBorderColor = "#666666"

    , manageHook = myManageHooks }

main = xmonad =<< dzen (withUrgencyHook dzenUrgencyHook myConfig)

-- nice colour is #cd8b00
