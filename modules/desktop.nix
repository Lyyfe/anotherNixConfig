# desktop.nix, desktop environment obvs
{pkgs, ...}: {
  environment.sessionVariables = {
    "NIXOS_OZONE_WL" = "1"; # for any ozone-based browser & electron apps to run on wayland
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    "ELECTRON_OZONE_PLATFORM_HINT" = "auto"; # enable native Wayland support for most Electron apps
    # misc
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
    "SDL_VIDEODRIVER" = "wayland";
    "GDK_BACKEND" = "wayland";
    "XDG_SESSION_TYPE" = "wayland";
  };

  environment.systemPackages = with pkgs; [
    quickshell # desktop shell
    fuzzel # application launcher
    kitty # terminal emulator
    hyprpaper # wallpaper utility, maybe replace with hyprlax
    nemo # file explorer
    mako # notification daemon

    # TODO add a display manager
  ];

  services.displayManager.ly.enable = true; # use ly for now, maybe sddm later

  programs.niri.enable = true; # window manager, maybe use hyprland for linux-antiquity

  programs.xwayland.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "extd";
  };

  # Configure console keymap
  console.keyMap = "uk";

}
