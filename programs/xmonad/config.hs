import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import Codec.Binary.UTF8.String as UTF8

import qualified DBus as D
import qualified DBus.Client as D

main :: IO ()
main = do
  xmonad $ docks def
    { borderWidth = 0
    , layoutHook =
        avoidStruts .
        spacingRaw True (Border 0 2 2 2) True (Border 2 2 2 2) True $
        layoutHook def
    , terminal = "kitty"
    }
  where
    tall = Tall 1 (3/100) (1/2)

mkDbusClient :: IO D.Client
mkDbusClient = do
  dbus <- D.connectSession
  D.requestName dbus (D.busName_ "org.xmonad.log") opts
  return dbus
  where
    opts = [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str =
  let
    opath = D.objectPath_ "/org/xmonad/Log"
    iname = D.interfaceName_ "org.xmonad.Log"
    mname = D.memberName_ "Update"
    signal = D.signal opath iname mname
    body = [D.toVariant $ UTF8.decodeString str]
  in
    D.emit dbus $ signal { D.signalBody = body }

polybarHook :: D.Client -> PP
polybarHook dbus =
  let
    wrapper c s | s /= "NSP" = wrap ("&{F" <> c <> "} ") " %{F-}" s
    blue = "#2E9AFE"
    gray = "#7F7F7F" 
    orange = "#ea4300"
    purple = "#9058c7"
    red = "#722222"
  in
    def
      { ppOutput = dbusOutput dbus
      , ppCurrent = wrapper blue
      , ppVisible = wrapper gray
      , ppUrgent = wrapper orange
      , ppHidden = wrapper gray
      , ppHiddenNoWindows = wrapper red
      , ppTitle = shorten 100 . wrapper purple
      }

myPolybarLogHook dbus = myLogHook <+> dynamicLogWithPP (polybarHook dbus)
myLogHook = fadeInactiveLogHook 0.9
