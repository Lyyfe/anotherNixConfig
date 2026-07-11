# development.nix, for when im freekin coding
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor # editor, obvs
    gh # github cli

    # nix stuff
    devenv # development environments, could also just use nixshell
    alejandra # formatter
    nixd # language server
    nil # different language server, idk which one is better
  ];
  # sum devshell devenv type beat idk
}
