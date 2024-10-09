{
  pkgs,
  inputs,
  ...
}: let
in {
  home.packages = with pkgs; [
    #patched-glfw
    steam
    java
    mangohud
    gamemode
    prism
    piper
    proton-ge-custom
    latencyflex-vulkan
  ];
}
