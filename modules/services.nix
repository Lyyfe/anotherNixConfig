# services.nix, services obvs, kinda just miscellaneous for now
# yoinked from https://github.com/ryan4yin/nix-config/blob/main/modules/nixos/desktop/peripherals.nix
{...}: {
  # enable bluetooth & gui paring tools - blueman
  # or you can use cli:
  # $ bluetoothctl
  # [bluetooth] # power on
  # [bluetooth] # agent on
  # [bluetooth] # default-agent
  # [bluetooth] # scan on
  # ...put device in pairing mode and wait [hex-address] to appear here...
  # [bluetooth] # pair [hex-address]
  # [bluetooth] # connect [hex-address]
  # Bluetooth devices automatically connect with bluetoothctl as well:
  # [bluetooth] # trust [hex-address]
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services = {
    printing.enable = true; # Enable CUPS to print documents.
    geoclue2.enable = true; # Enable geolocation services.
    libinput.enable = true; # trackpad support
  };
}
