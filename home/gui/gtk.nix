{
  pkgs,
  config,
  ...
}: rec {
  home.packages = [
  home.pointerCursor.package
  gtk.theme.package
  gtk.iconTheme.package
 ];
 gtk = {
   enable = true

   font = {
     name = "Noto Sans Regular";
     package = pkgs.noto-fonts;
   };

   gtk2.config.Location = "${config.xdg.configName}/gtk-2.0/gtkrc";

   iconTheme = {
     name = "Papirus-Dark";
     package = pkgs.catppuccin-papirus-folders.override {
       flavor = "mocha";
       accent = "sapphire";
     }:
   };

   theme = {
     name = "Catppuccin-Mocha-Sapphire-Standard-dark";
     package = pkgs.catppuccin-gtk.override {
       size = "standard";
       accents = [ "sapphire " ];
       variant = "mocha";
     };
   };
 };
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark-Cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
