{ config, pkgs, ... }:

{

  environment.shells = [ pkgs.fish pkgs.zsh ];
#  users.users.anton = {
#    shell = "/run/current-system/sw/bin/fish";
#  };

  programs.fish.enable = true;
#  programs.fish.useBabelfish = true;
#  programs.fish.vendor.completions.enable = true;
#  programs.fish.vendor.functions.enable = true;
#
#  programs.zsh.enable = true;

  users.users.anton = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;  # default shell on catalina
  programs.zsh.enableCompletion = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;
  programs.zsh.enableSyntaxHighlighting = true;

  programs.zsh.variables = {
    ZSH_THEME = "powerlevel10k/powerlevel10k";
  };

  environment.shellAliases = {
    ll = "ls -alh";
    l = "ls";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    python = "python3";

    # lock screen
    afk = "open -a ScreenSaverEngine";
  };

  # add functions (e.g. for zsh)
  programs.zsh.shellInit = ''
    # add custom functions
    function copy() {
      pbcopy < "$1"
    }
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

}
