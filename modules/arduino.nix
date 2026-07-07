{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
  	arduino-ide
  ];

  boot.kernelModules = [ "usbserial" "cp210x" "ch341" "ftdi_sio" ];
  
  services.udev.packages = with pkgs; [
    # PlatformIO udev rules (includes ESP32)
    platformio-core.udev 
    # Or manually add rules
  ];
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="10c4", MODE="0666"
    SUBSYSTEM=="usb", ATTR{idVendor}=="1a86", MODE="0666"
    SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0666"
  '';
  
  # Add your user to necessary groups
  users.users.sliden = {
    extraGroups = [ "dialout" "tty" "uucp" ];
  };

}
