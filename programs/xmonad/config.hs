import XMonad
import XMonad.Layout.Spacing

main :: IO ()
main = do
  xmonad $ def
    { borderWidth = 0
    , layoutHook = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ layoutHook def
    , terminal = "kitty"
    }
