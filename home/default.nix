{ username, ...}:
{
  imports =
    [
      ./chrome.nix
      ./discord.nix
      ./firefox.nix
      ./gh.nix
      ./git.nix
      ./rectangle.nix
      ./ripgrep.nix
      ./spotify.nix
      ./telegram.nix
      ./tmux.nix
      ./vim.nix
      ./vlc.nix
      # TODO: configure vscode
      ./vscode.nix
      ./wget.nix
      ./whatsapp.nix
      ./wkhtmltopdf.nix
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

  # allow unfree packages to be installed
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
