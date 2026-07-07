{
  config,
  pkgs,
  lib,
  ...
}:

{
  users.users.sliden = {
    isNormalUser = true;
    description = "sliden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
