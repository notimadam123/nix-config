{ pkgs, conifgs, ...}: {
  imports = [
  ../../home/pkgs.nix
# TODO
  ];

  home = {
    inherit (config.var) username;
    inherit (conifg.var) homeDirectory;
  
  stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
};
