{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    quickshell # desktop shell
    niri # window manager
    fuzzel # application launcher
    kitty # terminal emulator
    hyprpaper # wallpaper utility, maybe replace with hyprlax
    nemo # file explorer
    mako # notification daemon

  ];
}
