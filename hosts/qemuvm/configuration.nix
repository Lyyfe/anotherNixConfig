{
  config,
  modules,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    modules.desktop
    modules.fonts
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = config.system.nixos.release;
}
