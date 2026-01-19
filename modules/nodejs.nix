{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    nodejs
  ];
}
