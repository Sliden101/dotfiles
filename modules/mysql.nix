{
  config,
  pkgs,
  lib,
  ...
}:

{
  #home-manager.users.sliden.home.packages = with pkgs; [
    
  #];
  services.mysql = {
	enable = true;
	package = pkgs.mariadb_114;
  };

  environment.systemPackages = [ pkgs.mycli ];
}
