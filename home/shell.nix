{...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    history.share = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    historySubstringSearch.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
        "docker"
      ];
      theme = "fishy";
    };
    initExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };


}