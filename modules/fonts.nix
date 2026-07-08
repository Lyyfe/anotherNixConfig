{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      maple-mono.Normal-Normal-Variable
      atkinson-hyperlegible-next
      twemoji-color-font
    ];
  };

}
