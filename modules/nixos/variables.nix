{ config, ... }: {
  imports = [ ../modules/variables-config.nix ];

  config.var = {
    hostname = "tfd";
    username = "ye";
    homeDirectory = "/home/" + config.var.username;
    configDirectory = config.var.homeDirectory + "/.config/nix";

    keyboardLayout = "uk";

    location = "London";
    timeZone = "Europe/London";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_GB.UTF-8";

    git = {
      username = "notimadam123";
#TODO
    };

    sops = true;

  };
}
