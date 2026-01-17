{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    jdk21_headless
    #jdk8_headless
  ];
}
