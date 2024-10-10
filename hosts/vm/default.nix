{ pkgs, config, lib, ... }: 
{
  networking.hostName = "tpd";
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./disko-config.nix
    inputs.disko.nixosModules.disko
  ];

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };
}
