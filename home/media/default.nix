{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./mpv.nix
  ];
  home.pacakges = with pkgs; [
      playerctl
      pavucontrol
      spicetify
      spotify
    ];
  }
