{
  config,
  pkgs,
  lib,
  ...
}:
{
  home-manager.users.sliden.home.packages = with pkgs; [
    age
    djvu2pdf
    file
    gnuplot
    inxi
    ispell
    lsof
    monolith
    ocrmypdf
    pandoc
    pciutils # lspci
    ripgrep
    smartmontools
    taskwarrior-tui
    taskwarrior3
    termdown
    tt
    usbutils # lsusb
    yt-dlp


    ffmpeg-full
    # archives
    zip
    unzip
    xz
    peazip
    unrar-free
    rar
	
    aria2
    flameshot

    appimage-run

    p7zip

    bun
    xsel
    supabase-cli

    nmap
    tmux

];

  services.ollama = {
	enable = true;
  };
}

