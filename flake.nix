#flake.nix, the big file that controls everything else
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
      apparmor = .modules/apparmor.nix;
      desktop = ./modules/desktop.nix;
      development = ./modules/development.nix;
      fcitx5 = ./modules/fcitx5.nix;
      fonts = ./modules/fonts.nix;
      gaming = ./modules/gaming.nix;
      media = ./modules/media.nix;
      nix = ./modules/nix.nix;
      packages = ./modules/packages.nix;
      pipewire = ./modules/pipewire.nix;
      power = ./modules/power.nix;
      security = ./modules/security.nix;
      services = ./modules/services.nix;
    };

    users = {
      pandish = ./users/pandish.nix;
    };

    nixosConfigurations = {
      qemuvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          modules = self.nixosModules;
          users = self.users;
        };
        modules = [
          {networking.hostName = "qemuvm";}
          ./hosts/qemuvm/configuration.nix
        ];
      };
    };
  };
}
