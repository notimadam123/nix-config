{ inputs, nixpkgs, self, host, ... }:
{
  imports = [
    ./audio.nix
    ./gvfs.nix          
    ./network-manager.nix  
    ./systemd-boot.nix  
    ./kernel.nix
    ./usb.nix    
    ./utils.nix
    ./bluetooth.nix  
    ./locale.nix
    ./fonts.nix    
    ./nix.nix
    ./users.nix
    ./virtualization.nix
  ];
}
