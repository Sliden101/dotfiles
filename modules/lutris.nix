{
  config,
  pkgs,
  lib,
  unstable,
  prismlauncher,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
	lutris
  	heroic
	mangohud
	gamemode
	unstable.protonplus
	prismlauncher.packages.${pkgs.system}.prismlauncher	
  ];
}
