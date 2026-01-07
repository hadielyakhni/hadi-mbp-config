{ pkgs, ... }:
{
  home.file = {
    ".ideavimrc".source = ./dotfiles/.ideavimrc;
  };

  programs = {
    ripgrep.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.packages = with pkgs; [
    # Packages
    (pkgs.python312.withPackages (ppkgs: [
      ppkgs.pip
      ppkgs.virtualenv
      ppkgs.pylint
      ppkgs.jedi
    ]))
    nodejs_22
    pkgsx86_64Darwin.wkhtmltopdf-bin
    tig
    tree
    ngrok
    awscli2
    terraform
  ];
}
