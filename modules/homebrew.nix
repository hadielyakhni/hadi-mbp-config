{ pkgs, unstablePkgs, ... }:
{

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    brews = [
      # The brews you don't find in nixpkgs
      "postgresql@16"
      "coreutils"
    ];

    # the apps that doesn't work well with nix
    casks = [
      "zwift"
      "betterdisplay"
      "notion"
      "pycharm"
      "visual-studio-code"
      "whatsapp"
      "github"
      "microsoft-edge"
      "firefox"
      "arc"
      "vlc"
      "cursor"
      "cold-turkey-blocker"
    ];
    caskArgs.no_quarantine = true;
  };
}
