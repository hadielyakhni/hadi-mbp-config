{ hostname, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    # TODO: add dirHashes: https://blog.myelin.ch/2018/12/14/named-directory-hash-table.html
    autosuggestion.enable = true;
    enableCompletion = true;
    history.share = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
	"vi-mode"
      ];
      theme = "simple";
    };
    initExtra = ''
      export PATH=$PATH:$HOME/Dev/odoo/scripts/db_manager
      source ~/Dev/odoo/scripts/o
      source ~/Dev/odoo/scripts/o_completion
      source ~/Dev/odoo/scripts/db_manager/zsh_completion
    '';
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/config#'${hostname}'";
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
