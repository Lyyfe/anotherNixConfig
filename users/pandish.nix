{...}:
{
  users.users."pandish" = {
    isNormalUser = true;
    createHome = true;
    name = "pandish":
    description = "pandish";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
