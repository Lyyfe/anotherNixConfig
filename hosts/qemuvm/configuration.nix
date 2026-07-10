# qemuvm/configuration.nix, for the vm im using to test this trash out on
{
  modules,
  users,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    users.pandish

    # modules.apparmor
    modules.desktop
    modules.development
    # modules.fcitx5
    modules.fonts
    # modules.gaming
    # modules.media
    modules.nix
    modules.packages
    # modules.pipewire
    # modules.power
    # modules.security
    modules.services
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.enable = false;
  };

  services.spice-vdagentd.enable = true; # spice for VM copy pasting

  system.stateVersion = "26.05";
  # DONT CHANGE THIS DAWG, UNLESS YOU CHECK
  # https://nixos.org/manual/nixos/stable/#sec-upgrading
  # https://nixos.org/manual/nixos/stable/options#opts-system.stateVersion
}
