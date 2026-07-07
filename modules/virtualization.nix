{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.virt-manager.enable = true;
  home-manager.users.sliden.home.packages = with pkgs; [
  	qemu
  ];
  users.groups.libvirtd.members = ["sliden"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

}
