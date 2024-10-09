{ config, pkgs, inputs, username, host, ...}:
let username = config.var.username;
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
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
  nix.settings.allowed-users = [ "${username}" ];
}
