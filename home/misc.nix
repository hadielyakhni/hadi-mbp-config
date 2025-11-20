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
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.pip
      ppkgs.virtualenv
      ppkgs.pylint
      ppkgs.jedi
    ]))
    nodejs_23
    pkgsx86_64Darwin.wkhtmltopdf-bin
    tig
    tree
    ngrok
    awscli2
    terraform

    # Apps
    iterm2
    discord
    rectangle
    spotify
    telegram-desktop
    zoom-us
    slack
  ];
}
