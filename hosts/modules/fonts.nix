{ pkgs, inputs, ... }: {

  fonts = {
    packages = with pkgs; [
    material-icons
    material-design-icons
    roboto
    iosevka-bin
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans Regular" "Noto Color Emoji" ];
        serif = [ "Noto Sans Regular" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
