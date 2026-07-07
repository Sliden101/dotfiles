{
  config,
  pkgs,
  lib,
  ...
}:

{
  nixpkgs.overlays = [
    (self: super: {
      stremio = super.stremio.override {
	# Force Qt6 if the package supports it
	qtwebengine = super.qt6.qtwebengine;
      };
    })
  ];

  home-manager.users.sliden.home.packages = with pkgs; [
    appimage-run
    baobab
    calibre
    cheese
    chromium
    dbeaver-bin
    djview
    evince
    file-roller
    flowtime
    foot
    gimp3
    gnome-disk-utility
    gnome-feeds
    gnome-solanum
    gnucash
    gnumeric
    gparted
    ideogram
    imv
    keepassxc
    koreader
    libreoffice
    mpv
    mupdf
    nwg-look # like a modern lxappearance
    obsidian
    protonmail-desktop
    quodlibet
    seahorse
    strawberry
    sxiv
    transmission_4-gtk
    v4l-utils
    viewnior
    vlc
    vscode
    wdisplays
    #zathura

    firefox-esr

    protonvpn-gui
    wireguard-tools

    #Recreation
    youtube-music
    #Reverse Engineering
    ghidra-bin

    #Databases
    mysql-workbench
    sqlitebrowser
    #IDES
    jetbrains.idea-oss
    antigravity

    kdePackages.kdenlive
    kdePackages.okular

    hoppscotch

    ngrok
    tshark
    jadx
    apktool
];

programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

}
