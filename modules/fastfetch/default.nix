{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    fastfetch
  ];

  home-manager.users.sliden.home.file.".sliden.d/data/nerv/nerv-color.txt".source =
    ./nerv/nerv-color.txt;
  home-manager.users.sliden.home.file.".sliden.d/bin/nervfetch".source = ./nerv/nervfetch.sh;
}
