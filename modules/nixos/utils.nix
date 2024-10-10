{ pkgs, config, ... }: {

  services = {
    xserver = {
      enable = true;
      xkb.layout = "gb";
    };
    gnome.gnome-keyring.enable = true;
  };
  console.keyMap = "uk";

  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    EDITOR = "nvim";
  };

  services.libinput.enable = true;
  programs.dconf.enable = true;
  programs.fish.enable = true;
  services = {
    dbus.enable = true;
    upower.enable = true;
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  environment.systemPackages = with pkgs;[
    fish
    fd
    bc
    gcc
    git-ignore
    xdg-utils
    wget
    curl
    fastfetch
  ];
}
