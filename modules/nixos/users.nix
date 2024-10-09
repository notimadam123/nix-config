{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ye = {
    isNormalUser = true;
    description = "ye";
    extraGroups = [ "libvirt" "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
  };
}
