{ config, pkgs, ...}: {
  imports =
# TODO
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
 }
  
