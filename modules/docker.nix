{
  config,
  pkgs,
  lib,
  ...
}:

{
  virtualisation.docker = {
    enable = true;
  };

  users.users.sliden.extraGroups = [ "docker" ];
}
