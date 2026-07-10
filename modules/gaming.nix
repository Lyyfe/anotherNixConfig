# gaming.nix, for all the heated gamer moments
# i prolly broke smth by changing graphic settings
{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    protonup-ng # run protonup to update
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
