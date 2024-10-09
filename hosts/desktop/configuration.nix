{ config, pkgs, ...}: {
  imports =
    ../../nixos/nix.nix
    ../../nixos/usb.nix
    ../../nixos/gvfs.nix
    ../../nixos/fonts.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/timezone.nix
    ../../nixos/audio.nix
    ../../nixos/home-manager.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/network-manager.nix
  [ 
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  stylix = {
  fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrains Mono Nerd Font";
    };
   };
   sansSerif = {
     package = pkgs.dejavu_fonts;
     name = "DejaVu Sans";
   };
   serif = {
     package = pkgs.dejavu_fonts;
     name = "DejaVu Serif";
   };
  };

  system.stateVersion = "24.05";
  powerManagement.cpuFreqGovernor = "performance";
 }
  
