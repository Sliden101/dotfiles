{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };
  home-manager.users.sliden.home.packages = with pkgs; [
    scrot
    arandr
    xorg.xev
  ];
  home-manager.users.eudoxia.home.file = {
    ".XCompose".source = ./xcompose.xcm;
  };
  home-manager.users.sliden.home.file.".xinitrc" = {
    source = ./xinitrc.sh;
    executable = true;
  };
}
