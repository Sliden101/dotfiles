{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    python314
    uv
    ruff
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
	Experimental = true;
	FastConnectable = true;
      };
      Policy = {
	AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;
}
