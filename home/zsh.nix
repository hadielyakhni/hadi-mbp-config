{...}: {
  programs.zsh = {
    autocd = true;
    # TODO: choose your keymap
    # defaultKeymap = "emacs";
    # TODO: add dirHashes: https://blog.myelin.ch/2018/12/14/named-directory-hash-table.html
    #  https://mynixos.com/home-manager/option/programs.zsh.dirHashes
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history.share = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
      ];
      theme = "fishy";
    };
    # TODO: what is the below line?
    initExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg(=5'
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}