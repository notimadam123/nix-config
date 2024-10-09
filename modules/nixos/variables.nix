{ config, ... }: {

  config.var = {
    username = "tpd";
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    keyboardLayout = "uk";

    location = "Belfast";
    timeZone = "Europe/London";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_GB.UTF-8";

    git = {
      username = "notimadam123";
      email = "171095855+notimadam123@users.noreply.github.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;
  };
}
