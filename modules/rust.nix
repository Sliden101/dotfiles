{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    cargo-deny
    cargo-machete
    cargo-watch
    rustup
  ];
}
