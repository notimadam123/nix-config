{
  pkgs,
  inputs,
  lib,
  ...
} @ args: {
  home.packages = with pkgs; [
    gnome.file-roller
    swww
    hyprpicker
    grimblast
    grim
    swappy
    brightnessctl
    wl-clipboard
  ];
  imports = [
    ./colors.nix
    ./gtk.nix
    ./hyprland.nix
  ];

  programs = {
    zathura.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.nix args;
    plugins = [ split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces ];
    xwayland = {
      enable = true;
      hidpi = false;
    };
  };
    services = {
      kdeconnect.enable = true;
      kdeconnect.indicator = true;
    };
  }
