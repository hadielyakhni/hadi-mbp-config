{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "b";
    shell = "${pkgs.zsh}/bin/zsh";
  };
}