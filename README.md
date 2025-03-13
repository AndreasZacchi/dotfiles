# ❄️ NixOS dotfiles

*My configuration files for NixOS.* 

## Info
------

|               | Wayland                 |
|---------------|-------------------------|
| **Shell:**    | bash                    |
| **WM:**       | sway + waybar           |
| **Terminal:** | alacritty               |
| **Launcher:** | rofi                    |

-----

## Commands to know
- Rebuild and switch the system configuration (replace yourComputer with the device name specified in the flake):
```
sudo nixos-rebuild switch --flake .#yourComputer
``` 
