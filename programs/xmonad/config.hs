-- You can edit this by entering a nix shell:
-- $ nix-shell
-- $ ghcid config.hs

import XMonad
import XMonad.Layout.Spacing
import qualified Data.Map as Map

main :: IO ()
main = do
  xmonad $ def
    { borderWidth = 0
    , layoutHook = spacingRaw True (Border 0 2 2 2) True (Border 2 2 2 2) True $ layoutHook def
    , terminal = "kitty"
    , keys = myKeys <> keys def
    }

myKeys :: XConfig l -> Map.Map (ButtonMask, KeySym) (X ())
myKeys XConfig { XMonad.modMask = modm } = Map.fromList
  [ ((0, audioLowerVolume), spawn "amixer -q sset Master 5%-")
  , ((0, audioRaiseVolume), spawn "amixer -q sset Master 5%+")
  , ((0, audioMute), spawn "amixer set Master toggle")
  , ((0, xK_Print), spawn "maim -ust 99999 | xclip -sel clipboard -t image/png")
  , ((controlMask, xK_Print), spawn "maim -us | xclip -sel clipboard -t image/png")
  , ((0, xK_Super_L), spawn "rofi -show drun")
  ]
  where
    audioLowerVolume = 0x1008ff11
    audioRaiseVolume = 0x1008ff13
    audioMute = 0x1008ff12
