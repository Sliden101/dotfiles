{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
}
