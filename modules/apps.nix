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


    casks = pkgs.callPackage ./casks.nix { };
    # remove casks from quarantine
    caskArgs.no_quarantine = true;
  };
}
