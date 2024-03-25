{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
#    (nerdfonts.override { fonts = [
##      "FiraCode"
#      # "JetBrainsMono"
#    ]; })
    # (google-fonts.override { fonts = [
    #   "Roboto Mono"
    # ]; })
  ];
  fonts.fontDir.enable = true;
}