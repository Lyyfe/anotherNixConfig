{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    quickshell # desktop shell
    fuzzel # application launcher
    kitty # terminal emulator
    hyprpaper # wallpaper utility, maybe replace with hyprlax
    nemo # file explorer
    mako # notification daemon
  ];

  programs.niri.enable = true; # window manager, maybe use hyprland for linux-antiquity
}
