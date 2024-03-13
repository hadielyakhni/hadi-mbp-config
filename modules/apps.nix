{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.virtualenv
      python-pkgs.pip
    ]))
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    brews = [
      # I try not to use brews, but sometimes it's necessary
    ];

    # apps removed from this option will not be uninstalled automatically
    masApps = {
    };

    casks = [
      "librewolf"
      "eloston-chromium"
      "discord"
      "slack"

      # Microsoft junk I need for work
      # uninstalling these is a pain, here's a guide:
      # https://support.microsoft.com/en-us/office/uninstall-office-for-mac-eefa1199-5b58-43af-8a3d-b73dc1a8cae3
      "microsoft-outlook"
      "microsoft-teams"
      "microsoft-excel"
      "microsoft-auto-update"  # the above casks depend on this (writing it here to remember)
    ];

    # remove casks from quarantine
    caskArgs.no_quarantine = true;
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [
      "FiraCode"
      # "JetBrainsMono"
    ]; })
    # (google-fonts.override { fonts = [
    #   "Roboto Mono"
    # ]; })
  ];
  fonts.fontDir.enable = true;
}
