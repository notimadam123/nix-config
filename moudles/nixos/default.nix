{ inputs, nixpkgs, self, username, host, ... }:
{
  imports = [
    ./audio.nix
    ./gvfs.nix          
    ./network-manager.nix  
    ./systemd-boot.nix  
    ./usb.nix    
    ./utils.nix
    ./bluetooth.nix  
    ./fonts.nix    
    ./home-manager.nix  
    ./nix.nix
    ./timezone.nix      
    ./users.nix
    ./virtualization.nix
  ];
}
