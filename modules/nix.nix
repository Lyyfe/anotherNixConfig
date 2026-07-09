#nix.nix, we heard you like nix, so we put a nix in your nix
{pkgs, ...}: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    package-version-server
  ];
}
