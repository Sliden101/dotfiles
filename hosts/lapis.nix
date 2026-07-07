{ config, pkgs, ... }:

{
  imports = [
    ./lapis-hardware.nix
  ];

  networking.hostName = "lapis";

  boot.initrd.luks.devices."luks-43e8a04f-68af-4a55-bf28-1873d4a89773".device = "/dev/disk/by-uuid/43e8a04f-68af-4a55-bf28-1873d4a89773";
}
