{ pkgs, lib, config, ... }:
let
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.git;
    userName = "Hadi El Yakhni";
    userEmail = "hael@odoo.com"; 
    aliases = {
      conf = "config --global --edit";
      rh = "reset HEAD";
      cdf = "clean -df";
    };
    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictStyle = "zdiff3";
      commit.verbose = true;
      diff.algorithm = "histogram";
      branch.sort = "committerdate";
      core = {
        editor = "vim";
      };
    };
    difftastic = {
      enable = true;
      display = "inline";
    };
    ignores = [ ".idea" ".DS_Store" ];
  };
}
