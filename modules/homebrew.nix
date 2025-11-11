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

    # the apps that doesn't work well with nix
    casks = [
      "zwift"
      "betterdisplay"
      "notion"
      "pycharm"
      "webstorm"
      "visual-studio-code"
      "whatsapp"
      "github"
      "google-chrome"
      "microsoft-edge"
      "firefox"
      "vlc"
      "cursor"
      "cold-turkey-blocker"
    ];
    caskArgs.no_quarantine = true;
  };
}
