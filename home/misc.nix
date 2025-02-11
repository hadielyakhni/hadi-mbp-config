{ pkgs, ... }:
{
  programs = {
    ripgrep.enable = true;
  };

  home.packages = with pkgs; [
    # Packages
    nodejs_23
    pkgsx86_64Darwin.wkhtmltopdf-bin
    tig
    tree

    # Apps
    iterm2
    discord
    rectangle
    spotify
    telegram-desktop
    google-chrome
  ];
}