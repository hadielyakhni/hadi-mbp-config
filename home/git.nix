{ pkgs, lib, config, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.git;
    userName = "Hadi El Yakhni";
    userEmail = "hael@odoo.com"; 
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
    ignores = [ ".idea" ".DS_Store" ];
  };
}
