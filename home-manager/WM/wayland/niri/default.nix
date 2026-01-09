{ lib, ... }:
{
  imports = [
    ../swaylock
  ];

  #        include "dms/layout.kdl"
  #        include "dms/binds.kdl"

  home.file.".config/niri/config.kdl" = {
    text = ''
      include "./dms/alttab.kdl"
      include "./dms/colors.kdl"
      include "./dms/wpblur.kdl"

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
          natural-scroll
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

      output "HDMI-A-1" {
        scale 1.0
        transform "normal"
        position x=0 y=0
      }

      output "eDP-1" {
        scale 1.4
        transform "normal"
        mode "1920x1080@79.982"
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

      cursor {
        xcursor-theme "volantes_light_cursors"
        xcursor-size 16
      }

      hotkey-overlay { skip-at-startup; }

      binds {
        Ctrl+Alt+A { spawn "dms" "ipc" "call" "dash" "toggle" "overview"; }
        Ctrl+Alt+C { spawn "dms" "ipc" "call" "control-center" "toggle"; }
        Ctrl+Alt+D { spawn "dms" "ipc" "call" "dash" "toggle" "media"; }
        Ctrl+Alt+L { spawn "dms" "ipc" "call" "wallpaper" "next"; }
        Ctrl+Alt+S { spawn "dms" "ipc" "call" "powermenu" "toggle"; }
        Ctrl+Alt+W { spawn "dms" "ipc" "call" "dankdash" "wallpaper"; }
        Mod+M { spawn "dms" "ipc" "call" "processlist" "toggle"; }
        Mod+N { spawn "dms" "ipc" "call" "notifications" "toggle"; }
        Mod+Space { spawn "dms" "ipc" "call" "spotlight" "toggle"; }
        Mod+V { spawn "dms" "ipc" "call" "clipboard" "toggle"; }

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
        Mod+Shift+R { switch-preset-column-width; }

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
        Mod+P { spawn "fuzzel"; }

        Mod+Tab { toggle-overview; }
        Mod+Shift+S { screenshot; }

        XF86AudioLowerVolume { spawn-sh "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-; dms ipc call audio increment 0"; }
        XF86AudioMute { spawn "dms" "ipc" "call" "audio" "mute"; }
        XF86AudioPlay { spawn "dms" "ipc" "call" "mpris" "playPause"; }
        XF86AudioRaiseVolume { spawn-sh "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+; dms ipc call audio increment 0"; }
        XF86MonBrightnessDown { spawn "dms" "ipc" "call" "brightness" "decrement" "5" ""; }
        XF86MonBrightnessUp { spawn "dms" "ipc" "call" "brightness" "increment" "5" ""; }
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
    '';
  };
}