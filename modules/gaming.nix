# gaming.nix, for all the heated gamer moments

{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    protonup # run protonup to update
    mangohud
    lutris
    bottles

    prismlauncher # minecraft launcher
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  services.xserver.videoDrivers = ["amdgpu"];
}
