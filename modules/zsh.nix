{ pkgs, ... }:
{
  # TODO: I guess it might not be useful? Delete if yes :)
  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  environment.shells = [
    pkgs.zsh
  ];
}
