{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    alacritty
  ];

  home-manager.users.sliden.home.file.".config/alacritty/alacritty.toml".source = ./config.toml;
}
