{ pkgs, ... }:
{
  home.packages = with pkgs; [
     prismlauncher-unwrapped # oss minecraft launcher
   ];
}
