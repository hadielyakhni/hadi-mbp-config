{ pkgs, ... }:
{
  home.packages = with pkgs; [
     wkhtmltopdf-bin
  ];
}
