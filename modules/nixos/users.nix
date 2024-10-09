{ pkgs, inputs, username, host, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      home.username = "${config.var.username}";
      home.homeDirectory = "/home/${config.var.username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${config.var.username} = {
    isNormalUser = true;
    description = "${config.var.username}";
    extraGroups = [ "libvirt" "networkmanager" "wheel" "plugdev" ];
    shell = pkgs.fish;
  };
  nix.settings.allowed-users = [ "${config.var.username}" ];
}
