{ 
  config, 
  pkgs, 
  lib, 
  inputs, 
  ... 
}:
{
  home-manager.users.sliden = { pkgs, inputs, ... }: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];    
    
    programs.zen-browser = {
      enable = true;
    };
  };
}

