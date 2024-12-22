{ pkgs, ... }:
{
  home.packages = with pkgs; [
     pkgsx86_64Darwin.wkhtmltopdf-bin
  ];
}
