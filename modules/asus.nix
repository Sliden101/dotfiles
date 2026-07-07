{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
}
