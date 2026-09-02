{ lib, ... }:
{
  imports = [
    ../swaylock
  ];

  #        include "dms/layout.kdl"
  #        include "dms/binds.kdl"
  # include "./dms/alttab.kdl"
  #     include "./dms/colors.kdl"
  #     include "./dms/wpblur.kdl"

  home.file.".config/niri/config.kdl" = {
    text = ''
      include "./outputs.kdl"

      input {
        keyboard {
          xkb {
            layout "dk"
          }
          repeat-delay 600
          repeat-rate 25
          track-layout "global"
          numlock
        }
        touchpad {
          tap
          dwt
          //natural-scroll
          accel-speed 0.1
          accel-profile "adaptive"
          scroll-method "two-finger"
        }
        mouse { accel-speed -0.5; }
        warp-mouse-to-focus
        workspace-auto-back-and-forth

        mod-key "Super"
        mod-key-nested "Alt"
      }

      cursor {
        xcursor-theme "Adwaita"
        xcursor-size 24
      }

      screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
      prefer-no-csd

      overview {
        workspace-shadow {
          softness 300
          spread 300
        }
      }

      layout {

	border {
	  off
	  width 0
	}
	focus-ring {
	  on
	  width 2
	}
        default-column-width { proportion 0.5; }
        preset-column-widths {
          proportion 0.25
          proportion 0.5
          proportion 0.75
        }
        center-focused-column "never"
      }

      hotkey-overlay { skip-at-startup; }

      binds {
        Mod+Space { spawn-sh "noctalia msg panel-toggle launcher"; }
        Mod+P { spawn-sh "noctalia msg panel-toggle launcher"; }

        Mod+Escape { spawn "noctalia" "msg" "session" "lock-and-suspend"; }

        Mod+BracketLeft { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }
        Mod+F { maximize-column; }
        Mod+H { focus-column-or-monitor-left; }
        Mod+Left { focus-column-or-monitor-left; }
        Mod+J { focus-window-or-workspace-down; }
        Mod+Down { focus-window-or-workspace-down; }
        Mod+K { focus-window-or-workspace-up; }
        Mod+Up { focus-window-or-workspace-up; }
        Mod+L { focus-column-or-monitor-right; }
        Mod+Right { focus-column-or-monitor-right; }
        Mod+R { switch-preset-column-width-back; }

        Mod+Shift+C { center-visible-columns; }
        Mod+Shift+F { fullscreen-window; }
        Mod+Shift+H { move-column-left-or-to-monitor-left; }
        Mod+Shift+Left { move-column-left-or-to-monitor-left; }
        Mod+Shift+J { move-column-to-workspace-down; }
        Mod+Shift+Down { move-column-to-workspace-down; }
        Mod+Shift+K { move-column-to-workspace-up; }
        Mod+Shift+Up { move-column-to-workspace-up; }
        Mod+Shift+L { move-column-right-or-to-monitor-right; }
        Mod+Shift+Right { move-column-right-or-to-monitor-right; }

        Mod+Ctrl+H     { focus-monitor-left; }
        Mod+Ctrl+Left  { focus-monitor-left; }

        Mod+Ctrl+J     { focus-monitor-down; }
        Mod+Ctrl+Down  { focus-monitor-down; }

        Mod+Ctrl+K     { focus-monitor-up; }
        Mod+Ctrl+Up    { focus-monitor-up; }

        Mod+Ctrl+L     { focus-monitor-right; }
        Mod+Ctrl+Right { focus-monitor-right; }

        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }

        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }

        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }

        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }



        
        Mod+C { close-window; }

        Mod+Return { spawn "alacritty"; }
        Mod+B { spawn "firefox"; }

        Mod+Tab { toggle-overview; }
        Mod+Shift+S { screenshot; }


        XF86AudioLowerVolume { spawn-sh "noctalia msg volume-down"; }
        XF86AudioMute { spawn-sh "noctalia msg volume-mute"; }
        XF86AudioPlay { spawn-sh "noctalia msg media-play-pause"; }
        XF86AudioNext { spawn-sh "noctalia msg media-next"; }
        XF86AudioPrev { spawn-sh "noctalia msg media-previous"; }
        XF86AudioRaiseVolume { spawn-sh "noctalia msg volume-up"; }
        XF86MonBrightnessDown { spawn-sh "noctalia msg brightness-down"; }
        XF86MonBrightnessUp { spawn-sh "noctalia msg brightness-up"; }
      }

      animations {
        slowdown 1.0

        horizontal-view-movement {
          duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1.0
        }

        overview-open-close {
	  duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1

        }

        window-close {
	  duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1.0
        }

        window-movement {
	  duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1.0

        }

        window-open {
	  duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1.0

        }

        window-resize {
	  duration-ms 300
          curve "cubic-bezier" 0.0 1.0 0.0 1.0

        }

        workspace-switch {
	  duration-ms 300
          curve "cubic-bezier" 0.1 1.0 0.1 1.0

        }
      }

      window-rule {
        match app-id="firefox$" title="^Picture-in-Picture$"
        open-floating true
      }
      layer-rule {
        match namespace="^quickshell$"
        place-within-backdrop true
      }

      // Floating Noctalia settings window.
      window-rule {
        match app-id="dev.noctalia.Noctalia"
        open-floating true
        default-column-width { fixed 1080; }
        default-window-height { fixed 920; }
      }

      window-rule {
      // Rounded corners for a modern look.
      geometry-corner-radius 20

      // Clips window contents to the rounded corner boundaries.
      clip-to-geometry true
    }
    // Set the overview wallpaper on the backdrop.
      layer-rule {
        match namespace="^noctalia-overview*"
        place-within-backdrop true
      }

    debug {
      // Allows notification actions and window activation from Noctalia.
      honor-xdg-activation-with-invalid-serial
    }

      recent-windows {
        debounce-ms 750
        open-delay-ms 0
        previews {
          max-height 600
          max-scale 0.3
        }
        binds {
          Ctrl+Alt+E { next-window; }
          Ctrl+Alt+Q { previous-window; }
        }
      }
      spawn-at-startup "noctalia"

    '';
  };
}