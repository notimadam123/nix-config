{ pkgs, config, lib, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
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
