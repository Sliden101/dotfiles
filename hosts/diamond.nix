{ config, pkgs, ... }:

{
  imports = [
    ./diamond-hardware.nix
    ../modules/nvidia.nix
    ../modules/asus.nix
  ];

  networking.hostName = "diamond";
}
