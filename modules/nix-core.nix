{ pkgs, lib, username, ... }:
{
  # enable flakes globally
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [
    username
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };
}