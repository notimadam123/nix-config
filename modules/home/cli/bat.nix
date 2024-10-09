{
  pkgs,
  config,
  ...
}: {
  xdg.configFile."bat/themes".source = pkgs.fetchFromGitHub {
    owner = "Catppuccin";
    repo = "bat";
  };
  xdg.configFile."bat/config".text = ''
      --theme="Catppuccin-mocha"
    '';
}

