{ username, ... }:
{
  imports =
    [
      ./btop.nix
      ./direnv.nix
      ./editorconfig.nix
      ./fd.nix
      ./ffmpeg.nix
      ./gh.nix
      ./git.nix
      ./gpg.nix
      ./htop.nix
      ./radare2.nix
      ./ripgrep.nix
      ./tmux.nix
      ./vim.nix
      ./wireguard.nix
      ./zsh.nix
    ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
