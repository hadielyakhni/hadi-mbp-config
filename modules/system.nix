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
  networking.hostName = hostname;
  networking.computerName = hostname;

  system = {
    defaults = {
      dock = {
        autohide = false;
      };
      smb.NetBIOSName = hostname;
    };
    # remove the annoying startup macos sound
    activationScripts.extraActivation.text = ''
      nvram StartupMute=%01
    '';
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  users.users."${username}" = {
    name = username;
    home = "/Users/${username}";
  };

  # use touch id for sudo auth
  security.pam.enableSudoTouchIdAuth = true;
}