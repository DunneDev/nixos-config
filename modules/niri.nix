{
  inputs,
  ...
}:
{
  programs.niri.settings = {
    prefer-no-csd = true;

    spawn-at-startup = [
      { command = [ "noctalia" ]; }
    ];

    input = {
      touchpad = {
        tap = true;
        natural-scroll = false;
      };
      focus-follows-mouse.enable = true;
    };

    layout = {
      gaps = 12;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];
      default-column-width = {
        proportion = 0.5;
      };

      focus-ring = {
        enable = true;
        width = 2;
        active.color = "#7aa2f7";
        inactive.color = "#3b4261";
      };

      border.enable = false;
    };

    binds = {
      # apps/launcer
      "Mod+Return".action.spawn = [ "kitty" ];
      "Mod+Space".action.spawn-sh = [ "noctalia msg panel-toggle launcher" ];
      "Mod+S".action.spawn-sh = [ "noctalia msg panel-toggle control-center" ];
      "Mod+Apostrophe".action.spawn-sh = [ "noctalia msg settings-toggle" ];
      "Alt+Tab".action.spawn-sh = [ "noctalia msg window-switcher" ];

      # window management
      "Mod+Q".action.close-window = [ ];
      "Mod+Shift+Q".action.quit = [ ];
      "Mod+V".action.toggle-window-floating = [ ];
      "Mod+F".action.fullscreen-window = [ ];
      "Mod+Shift+F".action.maximize-column = [ ];
      "Mod+C".action.center-column = [ ];

      # focus movement
      "Mod+H".action.focus-column-left = [ ];
      "Mod+L".action.focus-column-right = [ ];
      "Mod+J".action.focus-window-down = [ ];
      "Mod+K".action.focus-window-up = [ ];

      #move window
      "Mod+Shift+H".action.move-column-left = [ ];
      "Mod+Shift+L".action.move-column-right = [ ];
      "Mod+Shift+J".action.move-window-down = [ ];
      "Mod+Shift+K".action.move-window-up = [ ];

      # column into/out of a stack
      "Mod+Comma".action.consume-window-into-column = [ ];
      "Mod+Period".action.expel-window-from-column = [ ];

      # resize
      "Mod+Ctrl+H".action.set-column-width = [ "-10%" ];
      "Mod+Ctrl+L".action.set-column-width = [ "+10%" ];
      "Mod+Ctrl+J".action.set-window-height = [ "-10%" ];
      "Mod+Ctrl+K".action.set-window-height = [ "+10%" ];
      "Mod+R".action.switch-preset-column-width = [ ];
      "Mod+Shift+R".action.switch-preset-window-height = [ ];

      # workspaces
      "Mod+1".action.focus-workspace = [ 1 ];
      "Mod+2".action.focus-workspace = [ 2 ];
      "Mod+3".action.focus-workspace = [ 3 ];
      "Mod+4".action.focus-workspace = [ 4 ];
      "Mod+5".action.focus-workspace = [ 5 ];
      "Mod+6".action.focus-workspace = [ 6 ];
      "Mod+7".action.focus-workspace = [ 7 ];
      "Mod+8".action.focus-workspace = [ 8 ];
      "Mod+9".action.focus-workspace = [ 9 ];

      "Mod+Shift+1".action.move-window-to-workspace = [ 1 ];
      "Mod+Shift+2".action.move-window-to-workspace = [ 2 ];
      "Mod+Shift+3".action.move-window-to-workspace = [ 3 ];
      "Mod+Shift+4".action.move-window-to-workspace = [ 4 ];
      "Mod+Shift+5".action.move-window-to-workspace = [ 5 ];
      "Mod+Shift+6".action.move-window-to-workspace = [ 6 ];
      "Mod+Shift+7".action.move-window-to-workspace = [ 7 ];
      "Mod+Shift+8".action.move-window-to-workspace = [ 8 ];
      "Mod+Shift+9".action.move-window-to-workspace = [ 9 ];

      "Mod+Page_Down".action.focus-workspace-down = [ ];
      "Mod+Page_Up".action.focus-workspace-up = [ ];
      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = [ ];
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = [ ];
      };

      # monitors
      "Mod+Shift+Comma".action.focus-monitor-left = [ ];
      "Mod+Shift+Period".action.focus-monitor-right = [ ];
      "Mod+Ctrl+Shift+Left".action.move-window-to-monitor-left = [ ];
      "Mod+Ctrl+Shift+Right".action.move-window-to-monitor-right = [ ];

      # misc
      "Mod+Tab".action.toggle-overview = [ ];
      "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
      "Print".action.screenshot = [ ];
      "Mod+Shift+S".action.screenshot-screen = [ ];
      "Mod+Ctrl+Shift+S".action.screenshot-window = [ ];

      "XF86AudioRaiseVolume".action.spawn = [ "noctalia msg volume up" ];
      "XF86AudioLowerVolume".action.spawn = [ "noctalia msg volume down" ];
      "XF86AudioMute".action.spawn = [ "noctalia msg volume mute" ];
      "XF86MonBrightnessUp".action.spawn = [ "noctalia msg brightness-up" ];
      "XF86MonBrightnessDown".action.spawn = [ "noctalia msg brightness-down" ];
    };

    window-rules = [
      {
        matches = [ { app-id = "^org\\.gnome\\.Nautilus$"; } ];
        open-floating = true;
      }
    ];
  };
}
