{ inputs, nixpkgs, self, host, ... }:
{
  imports = [
    ./audio.nix
    ./gvfs.nix          
    ./network-manager.nix  
    ./systemd-boot.nix  
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
