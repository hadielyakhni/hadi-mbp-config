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
    extraConfig = {
      init.defaultBranch = "main";
      # commit.gpgSign = true;
      # gpg.program = "${config.programs.gpg.package}/bin/gpg2";

      # merge.conflictStyle = "zdiff3";
      # commit.verbose = true;
      # diff.algorithm = "histogram";
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

      aliases = {
        ac = "!git add -A && git commit -m";
        sta = "status -s";
        st = "status";
        conf = "config --global --edit";
        cge = "config --global --edit";
        ci = "commit";
        co = "checkout";
        cod = "checkout .";
        rh = "reset HEAD";
        aa = "add -A";
        cdf = "clean -df";
        p = "pull --ff-only";
        br = "branch";
        bra = "branch -a";
        ca = "commit --amend";
        cwa = "commit -a --amend";
        cw = "commit -a --amend --no-edit";
        nb = "checkout -b";
        pf = "push --force-with-lease";
        cp = "cherry-pick";
      };

    };
    
    # lfs.enable = true;

    # syntax highlighted diffs
    # difftastic.enable = true;
    diff-so-fancy.enable = true;
    ignores = [ ".idea" ".DS_Store" ];
  };
}
