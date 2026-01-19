{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable Steam system-wide
  programs.steam = {
    enable = true;

    # Extra compatibility packages for Proton / Steam Play
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
