import XMonad
import XMonad.Config.Gnome
import qualified Data.Map as M

keysToAdd x = 
    [
        -- launch synapse
           ((modMask x, xK_o), spawn "synapse")
    ]

myKeys x = M.union (keys gnomeConfig x) (M.fromList (keysToAdd x))

main = xmonad gnomeConfig
       { modMask = mod4Mask
        , keys = myKeys
        , focusFollowsMouse = False
       }
