#packages.nix, i havent organised these into modules yet so this is just miscellaneous garbage

{
  pkgs,
  ... }: {
    environment.systemPackages = with pkgs; [
      qbittorrent # for my linux isos :)
      equibop # main discord
      vesktop # uni discord
      audacity # find out if they use audacity 3 or 4
      bitwarden-desktop
      davinci-resolve
      # some firewall idk
    ]


}
