#fonts.nix, sum cool fonts that i like

{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      maple-mono.Normal-Normal-Variable
      atkinson-hyperlegible-next
      twemoji-color-font
      noto-fonts
      roboto-slab
    ];

    fontconfig = {
      allowBitmaps = true;

      defaultFonts = {
        emoji = ["twemoji-color-font"]
        monospace = ["maple-mono.Normal-Normal-Variable"]
        sansSerif = ["atkinson-hyperlegible-next"]
        serif = ["roboto-slab"] # might find something better
      }
    }
  };
}
