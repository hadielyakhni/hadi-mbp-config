{ pkgs, config, ... }:
{
  # if i modify the agent's settings, restart it with:
  #   gpgconf --kill gpg-agent
  # without this restart, changes won't apply.

  home.packages = with pkgs; [
    pinentry_mac
    gnupg
  ];

  launchd.agents.gpg-agent = {
    enable = true;
    config = {
      ProgramArguments = [ "${pkgs.gnupg}/bin/gpgconf" "--launch" "gpg-agent" ];
      RunAtLoad = true;
      KeepAlive.SuccessfulExit = false;  # Prevents the agent from staying stopped if it exits normally. Keeps it always ready.
      EnvironmentVariables.GNUPGHOME = config.programs.gpg.homedir;
    };
  };

  programs.gpg = {
    enable = true;
    settings = {
      trust-model = "tofu+pgp";  
      # Combines TOFU and PGP trust models:
      # - TOFU (Trust On First Use): Automatically trusts keys on first use unless conflicts arise.
      # - PGP: Lets you set manual trust levels for keys, adding fine-grained control.
    };
    publicKeys = [{
      source = ./pgp.asc;
      trust = 5;           # Trust level 5 = "ultimate trust." This key is fully trusted.
                           # so that my private key doesn't prompt for verifying its authenticity.
    }];
  };
}
