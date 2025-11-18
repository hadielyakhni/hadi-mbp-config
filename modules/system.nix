{ pkgs, hostname, username, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
  ###################################################################################
{
  networking = {
    hostName = hostname;
    computerName = hostname;
    dns = [
      "1.1.1.3"
      "1.0.0.3"
    ];
    knownNetworkServices = [
     "Wi-Fi"
    ];
  };

  system = {
    defaults = {
      dock = {
        autohide = false;
	mru-spaces = false;
      };
    };
  };

  users.users."${username}" = {
    name = username;
    home = "/Users/${username}";
  };

  # use touch id for sudo auth
  security.pam.enableSudoTouchIdAuth = true;
  system.stateVersion = 4;
}
