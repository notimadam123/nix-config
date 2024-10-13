{ inputs, ... }:
{
  imports = [
      ./config.nix
      ./hyprland.nix
      ./hyprlock.nix
      ./hypridle.nix
  ]
}
