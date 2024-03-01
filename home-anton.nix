{ pkgs, ... }:
let 
 #home-manager = builtins.fetchTarball {
 #  url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
 #  sha256 = "0562y8awclss9k4wk3l4akw0bymns14sfy2q9n23j27m68ywpdkh";
 #};
in
{
 #imports = [ "${home-manager}/nix-darwin" ];
 #home-manager.users.anton = {
 #  programs.fzf = {
 #    enable = true;
 #    enableZshIntegration = true;
 #  };

 #  home.stateVersion = "23.11";

 #};
}

