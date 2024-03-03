{ pkgs, config, ... }:
{

  # If I every change anything with this agent, changes might not apply until I restart gpgconf agent
  # gpgconf --kill gpg-agent

  home.packages = with pkgs; [
    pinentry
    pinentry-curses
    gnupg
  ];

  launchd.agents.gpg-agent = {
    enable = true;
    config = {
      ProgramArguments = [ "${pkgs.gnupg}/bin/gpgconf" "--launch" "gpg-agent" ];
      RunAtLoad = true;
      KeepAlive.SuccessfulExit = false;
      EnvironmentVariables.GNUPGHOME = config.programs.gpg.homedir;
    };
  };

  programs.gpg = {
    enable = true;
    settings = {
      trust-model = "tofu+pgp";
    };
    publicKeys = [{
      source = ./pgp.asc;
      trust = 5;
    }];
  };
}