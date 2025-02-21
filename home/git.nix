{ pkgs, lib, config, ... }:
let
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.git;
    userName = "Hadi El Yakhni";
    # TODO: use different email, depending on the current
    #  directory. See "So You Think You Know Git - FOSDEM 2024"
    userEmail = "hael@odoo.com"; 
    aliases = {
      conf = "config --global --edit";
      rh = "reset HEAD";
      cdf = "clean -df";
    };
    extraConfig = {
      init.defaultBranch = "main";
      # commit.gpgSign = true;
      # gpg.program = "${config.programs.gpg.package}/bin/gpg2";

      merge.conflictStyle = "zdiff3";
      commit.verbose = true;
      diff.algorithm = "histogram";
      # log.date = "iso";
      # column.ui = "auto";
      branch.sort = "committerdate";
      # Automatically track remote branch
      # push.autoSetupRemote = true;
      # Reuse merge conflict fixes when rebasing
      # rerere.enabled = true;
      # fetch = {
        # writeCommitGraph = true;
      # };

      core = {
        editor = "vim";
        # untrackedcache = true;
        # fsmonitor = true;
      };
    };
    
    # lfs.enable = true;

    difftastic = {
      enable = true;
      display = "inline";
    };
    ignores = [ ".idea" ".DS_Store" ];
  };
}
