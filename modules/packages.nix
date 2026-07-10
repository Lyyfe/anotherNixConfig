#packages.nix, i havent organised these into modules yet so this is just miscellaneous garbage
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # equibop # main discord
    # vesktop # uni discord
    # audacity # find out if they use audacity 3 or 4

    # bitwarden-desktop # password manager, tbh mostly just the browser version
    # cooked, old electron version

    # davinci-resolve # video editor
    # cooked, unfree

    # obsidian # text editor?
    # cooked, unfree

    fastfetch # for the screenshots
    chezmoi # dotfile management, cuz i can use it on stuff that doesnt have home manager

    # TODO add some firewall idk
  ];

  # version control
  programs.git.enable = true;

  # terminal text editor
  programs.nano.enable = true;
  programs.nano.syntaxHighlight = true;

  # # screen recorder
  # programs.obs-studio.enable = true;
  # programs.obs-studio.enableVirtualCamera = true;

  # #bittorrent client, for my linux isos :)
  # services.qbittorrent.enable = true;
}
