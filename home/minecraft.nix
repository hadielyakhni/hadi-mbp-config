{ pkgs, username, ... }:
{
  home.packages = with pkgs; [
     prismlauncher-unwrapped # oss minecraft launcher
     zulu17
  ];
  home.file."Applications/PrismLauncher.app".source = "${pkgs.prismlauncher-unwrapped}/PrismLauncher.app";
  home.file."Library/Application Support/PrismLauncher/java".source = "${pkgs.zulu17}";
}
