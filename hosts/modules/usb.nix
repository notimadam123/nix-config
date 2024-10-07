{ pkgs, config, ... }:

{
  services.udisks2.enable = true;
  environment.systemPackages = with pkgs; [ usbutils ];
}
