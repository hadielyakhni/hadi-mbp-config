{ pkgs, unstablePkgs, ... }:
{
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
      "vlc"
    ];
    caskArgs.no_quarantine = true;
  };
}
