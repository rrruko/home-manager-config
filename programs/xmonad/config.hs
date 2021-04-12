import XMonad
import XMonad.Layout.Spacing

main :: IO ()
main = do
  xmonad $ def
    { borderWidth = 0
    , layoutHook = spacingRaw True (Border 0 2 2 2) True (Border 2 2 2 2) True $ layoutHook def
    , terminal = "kitty"
    }
