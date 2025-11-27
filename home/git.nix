{ pkgs, lib, config, ... }:
let
  # TODO: what's this line? :)
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.git;
    userName = "Hadi El Yakhni";
    userEmail = "hael@odoo.com"; 
    aliases = {
      # mostly using oh-my-zsh git aliases
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
    ignores = [ ".idea" ".DS_Store" ];
  };
}
