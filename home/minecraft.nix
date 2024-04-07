{ pkgs, username, ... }:
{
  home.packages = with pkgs; [
     prismlauncher-unwrapped # oss minecraft launcher
  ];
  home.file."Applications/PrismLauncher.app".source = "${pkgs.prismlauncher-unwrapped}/PrismLauncher.app";
}
