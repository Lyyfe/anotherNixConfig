#fonts.nix, sum cool fonts that i like
{pkgs, ...}: {

  fonts = {
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;

    packages = with pkgs; [
      maple-mono.NormalNL-Variable
      atkinson-hyperlegible-next
      twemoji-color-font
      noto-fonts
      roboto-slab
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;

      defaultFonts = {
        emoji = ["twemoji-color-font"];
        monospace = ["maple-mono.NormalNL-Variable"];
        sansSerif = ["atkinson-hyperlegible-next"];
        serif = ["roboto-slab"]; # might find something better
      };
    };
  };
}
