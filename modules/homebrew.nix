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
      "docker"
      "docker-compose"
      "herdr"
      "colima"
    ];

    # the apps that doesn't work well with nix
    casks = [
      "zwift"
      "betterdisplay"
      "notion"
      "visual-studio-code"
      "github"
      "google-chrome"
      "arc"
      "vlc"
      "iterm2"
      "discord"
      "spotify"
      "telegram-desktop"
      "zoom"
      "slack"
      "garmin-express"
      "claude-code"
      "raycast"
      "session-manager-plugin"
    ];
    caskArgs.no_quarantine = true;
  };
}
