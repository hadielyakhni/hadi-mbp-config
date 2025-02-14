{ pkgs, unstablePkgs, ... }:
{
  # TODO: uncomment and understand the below python config
  # environment.systemPackages = [
  #   (unstablePkgs.python3.withPackages (python-pkgs: [
  #     python-pkgs.virtualenv
  #     python-pkgs.pip
  #     python-pkgs.pylint
  #     python-pkgs.jedi  # autocompletion for python nvim
  #     python-pkgs.openai
  #   ]))
  # ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    brews = [
      # The brews you don't find in nixpkgs
      "postgresql@14"
      "python@3.11"
      "python@3.12"
      "virtualenv"
      "coreutils"
    ];

    # apps removed from this option will not be uninstalled automatically
    masApps = {
    };

    # the apps that doesn't work well with nix
    casks = [
      "zwift"
      "betterdisplay"
      "notion"
      "pycharm"
      "visual-studio-code"
      "whatsapp"
      "github"
      "google-chrome"
    ];
    caskArgs.no_quarantine = true;
  };
}
