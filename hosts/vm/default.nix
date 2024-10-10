{ pkgs, config, lib, ... }: 
{
  networking.hostName = "tpd";
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./disko.nix
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
