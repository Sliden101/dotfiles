{
  config,
  pkgs,
  lib,
  ...
}:
{
  home-manager.users.sliden.home.packages = with pkgs; [
    meld
  ];

  home-manager.users.sliden.programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = [

    ];
    settings = {
      user = {
        name = "Sliden101";
        email = "chessplayz11@gmail.com";
      };
      color = {
        ui = "auto";
      };
      diff = {
        tool = "meld";
      };
      difftool = {
        prompt = false;
      };
      "difftool \"meld\"" = {
        cmd = "meld \"$LOCAL\" \"REMOTE\"";
      };
      "mergetool \"meld\"" = {
        prompt = false;
        cmd = "meld \"$LOCAL\" \"$BASE\" \"$REMOTE\" --ouput=\"$MERGED\"";
        trustExitCode = "true";
      };
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
      alias = {
        undo = "reset --soft HEAD~1";
        tree = "log -- pretty='%Cgreen%h%Creset [%ai] %s %Cred<%Creset%an%Cred>' --decorate --graph";
      };
    };
  };

}
