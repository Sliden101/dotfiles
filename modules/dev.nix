{
  config,
  pkgs,
  lib,
  inform7-nix,
  ...
}:

{
  home-manager.users.sliden.home.packages = with pkgs; [
    btop
    clang
    opencode
    curl
    fd
    ghostscript
    gnumake
    graphviz
    imagemagick
    inform6
    jekyll
    jq
    just
    lean4
    libxml2 # xmllint
    nixfmt-tree
    sass
    sqlite
    tokei
    tree
    #vim
    zola
  ];
}
