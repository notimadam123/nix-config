{ pkgs, ... }: {
  imports = [
  ./bat.nix
  ./cava.nix
  ./git.nix
  ];
  home.packages = with pkgs; [
    unzip
  ];
  programs.zoxide = {
    enable = true;
  };
}

