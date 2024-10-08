import System.Directory
import System.IO (hPutStrLn)

import XMonad

import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Actions.NoBorders

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.WindowSwallowing

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.ShowWName
import XMonad.Layout.SimplestFloat
import XMonad.Layout.NoBorders

import XMonad.Util.Run
import XMonad.Util.SpawnOnce

import Data.Monoid
import System.Exit

import XMonad.Util.EZConfig (additionalKeys)
import Graphics.X11.ExtraTypes.XF86

import qualified XMonad.StackSet    as W
import qualified Data.Map           as M
import qualified Data.Maybe         as DM


myTerminal           = "wezterm"

myFocusFollowsMouse  :: Bool
myFocusFollowsMouse  = True

myBorderWidth        = 2

myModMask            = mod4Mask

-- myWorkspaces         = ["Main","CP","Study","Dev","Conf","BG","Sys","Virt","Misc"]
myWorkspaces         = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#ff0000"

toggleFullscreen :: X ()
toggleFullscreen = do
    sendMessage ToggleStruts
    withFocused toggleBorder
    sendMessage ToggleGaps

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm                , xK_t     ), spawn $ XMonad.terminal conf                              )
    -- [ ((modm                , xK_t     ), spawn "wezterm start -- fish -c 'tmux'"                              )
    , ((modm                , xK_p     ), spawn ".config/rofi/launchers/type-1/launcher.sh"         )
    , ((modm .|. shiftMask  , xK_p     ), spawn ".local/bin/scripts/rofi-pdf"                       )
    , ((modm                , xK_q     ), kill                                                      )
    , ((modm                , xK_space ), sendMessage NextLayout                                    )
    , ((modm .|. controlMask, xK_t     ), toggleFullscreen                                          )
    , ((modm .|. shiftMask  , xK_space ), setLayout $ XMonad.layoutHook conf                        )
    , ((modm                , xK_n     ), refresh                                                   )
    , ((modm                , xK_Tab   ), windows W.focusDown                                       )
    , ((modm                , xK_j     ), windows W.focusDown                                       )
    , ((modm                , xK_k     ), windows W.focusUp                                         )
    , ((modm                , xK_Return), windows W.swapMaster                                      )
    , ((modm .|. shiftMask  , xK_j     ), windows W.swapDown                                        )
    , ((modm .|. shiftMask  , xK_k     ), windows W.swapUp                                          )
    , ((modm                , xK_h     ), sendMessage Shrink                                        )
    , ((modm                , xK_l     ), sendMessage Expand                                        )
    , ((modm .|. shiftMask  , xK_Return), withFocused $ windows . W.sink                            )
    , ((modm                , xK_comma ), sendMessage (IncMasterN 1)                                )
    , ((modm                , xK_period), sendMessage (IncMasterN (-1))                             )
    , ((modm                , xK_b     ), spawn "zen-browser -P \"Personal\" &"              )
    , ((modm .|. shiftMask  , xK_b     ), spawn "zen-browser -P \"IIITD\" &"                        )
    , ((modm .|. shiftMask  , xK_q     ), io exitSuccess                                            )
    , ((modm .|. shiftMask  , xK_h     ), spawn "xmonad --recompile; xmonad --restart"              )
    , ((modm .|. shiftMask  , xK_g     ), sendMessage ToggleGaps                                    )
    , ((modm .|. shiftMask  , xK_c     ), spawn "flameshot gui"                                     )
    , ((modm .|. shiftMask  , xK_a     ), spawn "killall flameshot"                                 )
    , ((modm .|. shiftMask  , xK_Right ), shiftToNext                                               )
    , ((modm .|. shiftMask  , xK_Left  ), shiftToPrev                                               )
    , ((0, xF86XK_MonBrightnessUp      ), spawn "brightnessctl set +10%"                            )
    , ((0, xF86XK_MonBrightnessDown    ), spawn "brightnessctl set 10%-"                            )
    , ((0, xF86XK_AudioLowerVolume     ), spawn "pactl set-sink-volume 0 -5%"                       )
    , ((0, xF86XK_AudioMute            ), spawn "pactl set-sink-mute 0 toggle"                      )
    , ((0, xF86XK_AudioRaiseVolume     ), spawn "pactl set-sink-volume 0 +5%"                       )
    , ((0, xF86XK_AudioPlay            ), spawn "playerctl play-pause"                              )
    , ((0, xF86XK_AudioNext            ), spawn "playerctl next"                                    )
    , ((0, xF86XK_AudioPrev            ), spawn "playerctl previous"                                )
    , ((0, xF86XK_AudioStop            ), spawn "playerctl stop"                                    )
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


-- gestures = M.fromList
  -- [ ( [ L ], \_ -> nextWS )
  -- , ( [ U ], \_ -> nextWS )
  -- , ( [ R ], \_ -> prevWS )
  -- , ( [ D ], \_ -> prevWS )
  -- ]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    , ((   0,       9), (\w -> focus w >> spawn
                                         "playerctl play-pause"))
    -- , ((0, button1), mouseGesture gestures)
    ]

mySWNConfig :: SWNConfig
mySWNConfig = def{
    swn_font      = "xft:JetBrainsMono Nerd Font:bold:size=50"
    , swn_fade    = 0.25
    , swn_bgcolor = "#000000"
    , swn_color   = "#ffffff"
}

myLayout =
         -- showWName' mySWNConfig
         -- $  spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True
         -- $  gaps [(U,30),(R,7),(L,7),(D,7)]
         avoidStruts myDefaultLayout
         where
            myDefaultLayout = tiled
                          ||| Mirror tiled
                          ||| Full
                          ||| simplestFloat
            tiled   = Tall nmaster delta ratio
            nmaster = 1
            ratio   = 1/2
            delta   = 3/100

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Xfce4-terminal" --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myEventHook = swallowEventHook (className =? "Alacritty") (return True)

myStartupHook = do
    spawnOnce "xrandr --dpi 120 &"
    spawnOnce "nitrogen --restore &"
    -- spawnOnce "picom &"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawn "xset s off -dpms"

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = DM.fromJust $ M.lookup ws myWorkspaceIndices

main = do
    xmproc <- spawnPipe "LC_CTYPE=en_US.utf8 xmobar -x 0 $HOME/.config/xmobar/xmobar.hs "
    xmonad $ ewmh $ docks $ def{
        terminal           = myTerminal          ,
        focusFollowsMouse  = myFocusFollowsMouse ,
        borderWidth        = myBorderWidth       ,
        modMask            = myModMask           ,
        workspaces         = myWorkspaces        ,
        normalBorderColor  = myNormalBorderColor ,
        focusedBorderColor = myFocusedBorderColor,

        keys               = myKeys              ,
        mouseBindings      = myMouseBindings     ,

        layoutHook         = smartBorders $ myLayout,
        manageHook         = myManageHook        ,
        handleEventHook    = myEventHook         ,
        logHook            = dynamicLogWithPP $ xmobarPP {
            ppOutput          = hPutStrLn xmproc,
            ppCurrent         = xmobarColor "#fabd2f" "" . wrap "[" "]" . clickable,
            ppVisible         = xmobarColor "#fabd2f" ""                . clickable,
            ppHidden          = xmobarColor "#fabd2f" ""                . clickable,
            ppHiddenNoWindows = xmobarColor "#928374" ""                . clickable,
            ppTitle           = xmobarColor "#ffffff" "" . shorten 50              ,
            ppSep             =  "  "                                              ,
            ppUrgent          = xmobarColor "#7D4A83" "" . wrap "!" "!" . clickable,
            ppExtras          = []                                                 ,
            ppOrder           = \(ws:l:t:ex) -> ws:[l]
        },
        startupHook        = myStartupHook
    }
