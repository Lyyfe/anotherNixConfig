#nix.nix, we heard you like nix, so we put a nix in your nix

{pkgs, ...}: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # i have no idea if i actually need this,
    # i just might have needed to while i was writing this initially
    package-version-server
  ];
}
