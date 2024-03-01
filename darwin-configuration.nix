{ config, pkgs, ... }:
let
  main_user = "anton";
  hostname = "${main_user}-mbp";
  home = "/Users/${main_user}";
in
{
  imports =
    [
      ./vim.nix
      ./tmux.nix
      ./zsh.nix
      ./home-anton.nix
    ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ 
    pkgs.btop
    pkgs.htop
    pkgs.nodejs-slim_21  # vim coc needs nodejs, might move it to vim.nix
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.virtualenv
      python-pkgs.pip
    ]))
  ];

  users.users."${main_user}".packages = [
    pkgs.wireguard-tools
  ];

  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [
    main_user
  ];


  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # investigate yabai! Looks cool (window manager)
  #services.yabai.enable = true;

  # programs.fish.enable = true;

  system.defaults.dock.autohide = false;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    brews = [
      "direnv"
#      {
#        name="postgresql@15";
#        restart_service = true;
#      }
    ];
  };


  # https://github.com/LnL7/nix-darwin/issues/339#issuecomment-1765304524
  # TODO: This is a workaround for the issue with the postgresql service.
  #  When nix-darwin is updated, this should be removed.
 #system.activationScripts.preActivation = {
 #  enable = true;
 #  text = ''
 #    if [ ! -d "${home}/postgresql/${config.services.postgresql.package.psqlSchema}/pgdata/" ]; then
 #      echo "creating PostgreSQL data directory..."
 #      sudo mkdir -p ${home}/postgresql/${config.services.postgresql.package.psqlSchema}/pgdata/
 #      chown -R ${main_user}:staff ${home}/postgresql/
 #      chmod -R 750 ${home}/postgresql/
 #    fi
 #  '';
 #};
 #services.postgresql = {
 #  enable = true;
 #  package = pkgs.postgresql_15;
 #  dataDir = "${home}/postgresql/${config.services.postgresql.package.psqlSchema}/pgdata/";
 #  initdbArgs = [
 #    "-U ${main_user}"
 #    "--pgdata=${home}/postgresql/${config.services.postgresql.package.psqlSchema}/pgdata/"
 #    "--auth=trust"
 #    "--no-locale"
 #    "--encoding=UTF8"
 #    # specify the superuser username
 #    "--username=${main_user}"
 #  ];
 #};
 #
 #launchd.user.agents.postgresql.serviceConfig = {
 #  StandardErrorPath = "${home}/postgresql/${config.services.postgresql.package.psqlSchema}/error.log";
 #  StandardOutPath = "${home}/postgresql/${config.services.postgresql.package.psqlSchema}/out.log";
 #};


  # use touch id for sudo auth
  security.pam.enableSudoTouchIdAuth = true;

  # remove the annoying startup macos sound
  system.activationScripts.extraActivation.text = ''
    nvram StartupMute=%01
  '';

  nixpkgs.hostPlatform = "aarch64-darwin";

 # system.nixpkgsRelease = "23.11";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
