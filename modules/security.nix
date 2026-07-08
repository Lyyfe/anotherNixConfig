# security.nix, i have no idea if this is legit, i just yoinked from someone
# https://github.com/ryan4yin/nix-config/blob/main/hardening/
# https://github.com/ryan4yin/nix-config/blob/main/modules/nixos/desktop/security.nix

{
  config,
  pkgs,
  modulesPath
  ...
}:
{
  #hardened profile
  imports = [
     (modulesPath + "/profiles/hardened.nix")
   ];

  systemd.coredump.enable = false;

  #apparmor
  services.dbus.apparmor = "enabled";
  security.apparmor = {
    enable = true;

    # kill process that are not confined but have apparmor profiles enabled
    killUnconfinedConfinables = true;
    packages = with pkgs; [
      apparmor-utils
      apparmor-profiles
    ];

    # apparmor policies
    policies = {
      "default_deny" = {
        enforce = false;
        enable = false;
        profile = ''
          profile default_deny /** { }
        '';
      };

      "sudo" = {
        enforce = false;
        enable = false;
        profile = ''
          ${pkgs.sudo}/bin/sudo {
            file /** rwlkUx,
          }
        '';
      };

      "nix" = {
        enforce = false;
        enable = false;
        profile = ''
          ${config.nix.package}/bin/nix {
            unconfined,
          }
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    apparmor-bin-utils
    apparmor-profiles
    apparmor-parser
    libapparmor
    apparmor-kernel-patches
    apparmor-pam
    apparmor-utils
  ];

  {
    config,
    pkgs,
    ...
  }:
  {
    # security with polkit
    security.polkit.enable = true;
    # security with gnome-kering
    services.gnome = {
      gnome-keyring.enable = true;
      # Use gnome keyring's SSH Agent
      # https://wiki.gnome.org/Projects/GnomeKeyring/Ssh
      gcr-ssh-agent.enable = false;
    };
    # seahorse is a GUI App for GNOME Keyring.
    programs.seahorse.enable = true;
    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    programs.ssh.startAgent = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
  
    # gpg agent with pinentry
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
      enableSSHSupport = false;
      settings.default-cache-ttl = 4 * 60 * 60; # 4 hours
    };
  }
}
