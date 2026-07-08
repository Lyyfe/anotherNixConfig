#flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # stable channel
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosModules = {
      desktop = "./modules/desktop.nix";
      fonts = "./modules/fonts.nix"
      gaming = "./modules/gaming.nix"
      packages = "./modules/packages.nix";
      security = "./modules/security.nix";
      services = "./modules/services.nix";
    };

    nixosConfigurations = {
      qemuvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          nixosModules = nixosModules;
        }
        modules = [
          "./hosts/qemuvm/configuration.nix"
        ];
      };
    };
  };
}
