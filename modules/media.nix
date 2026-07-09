{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mpc-qt
    freetube
    #stremio, no package on nixpkgs tragically
  ];
}
