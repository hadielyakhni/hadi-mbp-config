{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = [
    (unstablePkgs.python3.withPackages (python-pkgs: [
      python-pkgs.virtualenv
      python-pkgs.pip
      python-pkgs.pylint
      python-pkgs.jedi  # autocompletion for python nvim
      python-pkgs.openai
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
      "mfterm" # sshfs is broken on macos on nixpkgs
      "cliclick" # for automating mouse clicks
    ];

    # apps removed from this option will not be uninstalled automatically
    masApps = {
    };


    casks = pkgs.callPackage ./casks.nix { };
    # remove casks from quarantine
    caskArgs.no_quarantine = true;
  };
}
