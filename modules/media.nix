# media.nix, goin 2 da moveys :)

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mpc-qt
    freetube
    #stremio, no package on nixpkgs tragically, perhaps make it myself?
  ];
}
