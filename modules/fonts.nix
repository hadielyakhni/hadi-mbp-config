{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
#    (nerdfonts.override { fonts = [
##      "FiraCode"
#      # "JetBrainsMono"
#    ]; })
    (google-fonts.override { fonts = [
      "Inter"
    ]; })
  ];
  fonts.fontDir.enable = true;
}
