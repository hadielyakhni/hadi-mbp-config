{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # this allows to use the `ip` command on macOS like ip route, ip addr, etc.
    darwin.iproute2mac
  ];
}
