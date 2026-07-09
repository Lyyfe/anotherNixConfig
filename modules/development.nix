# development.nix, for when im freekin coding
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
}
