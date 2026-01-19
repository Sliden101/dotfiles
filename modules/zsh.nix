{
  config,
  pkgs,
  lib,
  ...
}:
{

  home-manager.users.sliden.programs.zsh = {
    enable = true;
    enableCompletion = true;
    #enableBashCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ff = "fastfetch";
      update = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
      ];
      custom = "$HOME/.oh-my-zsh/custom/";
      theme = "robbyrussell";
    };
  };

  home-manager.users.sliden.home.packages = with pkgs; [
    zsh
    zsh-powerlevel10k
    meslo-lgs-nf
    direnv
    oh-my-zsh
  ];

  #home-manager.users.sliden.home.file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;

}
