{
  inputs,
  lib,
  config,
  pkgs,
  modules
  ...
}:
{
  imports = [
    "./hardware-configuration.nix"

    modules.desktop
    modules.fonts
  ]
}
