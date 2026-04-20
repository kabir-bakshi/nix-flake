# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = lib.mkForce "Noto Sans 12";
      font-name = lib.mkForce "Adwaita Sans 12";
      gtk-theme = "adw-gtk3";
      monospace-font-name = lib.mkForce "IntoneMono Nerd Font 13";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      natural-scroll = true;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize,appmenu:";
      resize-with-right-button = true;
    };

    "org/gnome/eog/ui" = {
      sidebar = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" ];
      magnifier = [ "<Super>z" ];
      magnifier-zoom-in = [ "<Super>s" ];
      magnifier-zoom-out = [ "<Super>a" ];
      rotate-video-lock-static = [];
      volume-down = [ "<Alt>comma" ];
      volume-mute = [ "<Alt>slash" ];
      volume-step = 5;
      volume-up = [ "<Alt>period" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt>z";
      command = "sudo ddcutil setvcp 10 - 10";
      name = "Decrease Brightness";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Alt>x";
      command = "sudo ddcutil setvcp 10 + 10";
      name = "Increase Brightness";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Alt>a";
      command = "sudo ddcutil setvcp 12 - 10";
      name = "Decrease Contrast";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Alt>s";
      command = "sudo ddcutil setvcp 12 + 10";
      name = "Increase Contrast";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Super>e";
      command = "com.github.cassidyjames.ideogram";
      name = "com.github.cassidyjames.ideogram";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing"; # Doesn't let gnome sleep on inactivity
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "bluetooth-battery-monitor@v8v88v8v88.com" "dash-to-dock@micxgx.gmail.com" ];
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "appindicatorsupport@rgcjonas.gmail.com" "emoji-selector@maestroschan.fr" "emoji-copy@felipeftn" "paperwm@paperwm.github.com" ];
      favorite-apps = [ "brave-browser.desktop" "com.github.wwmm.easyeffects.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Terminal.desktop" "org.gnome.Settings.desktop" "org.gnome.Extensions.desktop" "com.heroicgameslauncher.hgl.desktop" "org.jdownloader.JDownloader.desktop" "org.telegram.desktop.desktop" ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      autohide = true;
      autohide-in-fullscreen = true;
      background-opacity = 0.8;
      click-action = "minimize";
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-fixed = false;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      intellihide = true;
      intellihide-mode = "ALL_WINDOWS";
    };

    "org/gnome/shell/extensions/emoji-copy" = {
      active-keybind = true;
      always-show = true;
      emoji-keybind = [ "<ctrl>period" ];
    };

    "org/gnome/shell/extensions/paperwm" = {
      default-focus-mode = 1;
      gesture-workspace-fingers = 4;
      horizontal-margin = 0;
      last-used-display-server = "Wayland";
      open-window-position = 0;
      open-window-position-option-down = false;
      restore-attach-modal-dialogs = "true";
      restore-edge-tiling = "true";
      restore-workspaces-only-on-primary = "true";
      selection-border-size = 0;
      vertical-margin = 0;
      vertical-margin-bottom = 0;
      window-gap = 8;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
  };
}
