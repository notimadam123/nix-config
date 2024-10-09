{ config, pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.fish;
    users.${config.var.username} = {
      isNormaluser = true;
      description = "${config.var.username} account";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
