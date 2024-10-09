{ pkgs, conifgs, ...}: {
  imports = [
    ../../home/cli
    ../../home/gui
    ../../home/games
    ../../home/media
  ];

  home = {
    inherit (config.var) username;
    inherit (conifg.var) homeDirectory;
  
  stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
};
